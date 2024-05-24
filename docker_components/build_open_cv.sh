# Install opencv from source 
conda activate ffcv 

cd /workspace
mkdir -p env
mkdir Install-OpenCV
cd Install-OpenCV
wget -O opencv.zip https://github.com/opencv/opencv/archive/4.x.zip
unzip opencv.zip
mv opencv-4.x opencv

cd opencv 
mkdir -p build && cd build
echo "cmake opencv..."
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/workspace/env/Install-OpenCV/source/ -D OPENCV_GENERATE_PKGCONFIG=ON -D BUILD_EXAMPLES=OFF -D INSTALL_PYTHON_EXAMPLES=OFF -D INSTALL_C_EXAMPLES=OFF -D PYTHON_EXECUTABLE=$(which python2) -D BUILD_opencv_python2=OFF -D PYTHON3_EXECUTABLE=$(which python3) -D OPENCV_GENERATE_PKGCONFIG=ON -D PYTHON3_INCLUDE_DIR=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") -D PYTHON3_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") .. \

echo "make -j8..."
make -j8
echo "make install..."
make install

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/workspace/env/Install-OpenCV/source/lib/pkgconfig
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/workspace/env/Install-OpenCV/source/lib

# build libturbojpeg
mkdir -p /workspace/env/Install-libjpeg-turbo/ && cd /workspace/env/Install-libjpeg-turbo/
wget https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/heads/main.zip
unzip main.zip 
mv libjpeg-turbo-main libjpeg-turbo
cd libjpeg-turbo

mkdir -p build && cd build
echo "cmake libturbojpeg..."
cmake -DCMAKE_INSTALL_PREFIX=/workspace/env/Install-libjpeg-turbo/install/ ..
echo "make -j8..."
make -j8
echo "make install..."
make install

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/workspace/env/Install-libjpeg-turbo/install/lib/pkgconfig
# configure LD_library
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/workspace/env/Install-libjpeg-turbo/install/lib/

# install ffcv
echo "runing /opt/conda/envs/ffcv/bin/pip3 install ffcv ..."
/opt/conda/envs/ffcv/bin/pip3 install ffcv
