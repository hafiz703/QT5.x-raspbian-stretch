# Install QT5.12.3 on rasbian stretch 
cd
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

# Install needed packages
sudo apt-get -y --force-yes install sense-hat libatspi-dev build-essential libfontconfig1-dev libdbus-1-dev libfreetype6-dev libicu-dev libinput-dev libxkbcommon-dev libsqlite3-dev libssl-dev libpng-dev libjpeg-dev libglib2.0-dev libraspberrypi-dev
sudo apt-get -y --force-yes install bluez libbluetooth-dev
sudo apt-get -y --force-yes install libasound2-dev pulseaudio libpulse-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-plugins-bad gstreamer1.0-pulseaudio gstreamer1.0-tools gstreamer1.0-alsa gstreamer-tools
sudo apt-get -y --force-yes install libpq-dev libmariadbclient-dev


wget http://download.qt.io/official_releases/qt/5.12/5.12.3/single/qt-everywhere-src-5.12.3.tar.xz

# Untar Source code
tar xf qt-everywhere-src-5.12.3.tar.xz

# Delete source tarball to save some space
sudo rm -r qt-everywhere-src-5.12.3.tar.xz

git clone https://github.com/oniongarlic/qt-raspberrypi-configuration.git
cd qt-raspberrypi-configuration && make install DESTDIR=../qt-everywhere-src-5.12.3
sudo apt-get install build-essential libfontconfig1-dev libdbus-1-dev libfreetype6-dev libicu-dev libinput-dev libxkbcommon-dev libsqlite3-dev libssl-dev libpng-dev libjpeg-dev libglib2.0-dev libraspberrypi-dev


# Create Shadow build directory 
cd
mkdir build
#cd build

# create and Change ownership of QT install folder
sudo mkdir /opt/QT5
sudo chown pi:pi /opt/QT5



PKG_CONFIG_LIBDIR=/usr/lib/arm-linux-gnueabihf/pkgconfig:/usr/share/pkgconfig \
../qt-everywhere-src-5.12.3/configure -platform linux-rpi-g++ \
-v \
-opengl es2 -eglfs \
-no-gtk \
-opensource -confirm-license -release \
-reduce-exports \
-force-pkg-config \
-nomake examples -no-compile-examples \
-skip qtwayland \
-skip qtwebengine \
-skip qtscript \
-skip qt3d -release \
-qt-pcre \
-no-pch \
-ssl \
-evdev \
-system-freetype \
-fontconfig \
-glib \
-prefix /opt/Qt5 \
-qpa eglfs


# Compile QT with 4 cores 
#make -j2


# Install QT on the system 
#sudo make install


# Add enviroment variables to bashrc
#echo 'export LD_LIBRARY_PATH=/opt/QT5/lib' >> ~/.bashrc 
#echo  'export PATH=/opt/QT5/bin:$PATH' >> ~/.bashrc 
