apt-get update && apt-get install -y --no-install-recommends \
        software-properties-common \
        build-essential \
        curl \
        git \
        ffmpeg \
        tmux \
        cmake \
        g++ wget unzip \
        pkg-config \
        vim

# ENV variable
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/workspace/env/Install-OpenCV/source/lib/pkgconfig
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/workspace/env/Install-libjpeg-turbo/install/lib/pkgconfig

# configure LD_library
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/workspace/env/Install-OpenCV/source/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/workspace/env/Install-libjpeg-turbo/install/lib/
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
conda init bash 

conda create -n ffcv python=3.9 -y

# source /workspace/env/miniconda3/etc/profile.d/conda.sh


