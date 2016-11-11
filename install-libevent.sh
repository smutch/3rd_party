url='https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz'
tarball=$(basename $url)
dirname=$(sed "s/\.tar\.gz//" <<< $(basename $url))
ha_gpg_url='https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz.asc'

if [ ! -e $tarball ]
then
    wget $url
    wget $ha_gpg_url
    gpg --verify $(basename $ha_gpg_url) $tarball || (echo "Failed gpg signature check!" && exit -1)
fi

mkdir $dirname
cd $dirname
tar xzf ../$tarball
mv $dirname src
prefix=$(pwd)
cd src

./configure --prefix=$prefix && \
    make && \
    make install && \
    cd ../.. && \
    rm -r $dirname/src || (echo "BUILD FAILED!"; cd ../..)
