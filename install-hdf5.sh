url='https://support.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.8.17.tar.gz'
tarball=$(basename $url)
dirname=$(sed "s/\.tar\.gz//" <<< $(basename $url))
ha='7d572f8f3b798a628b8245af0391a0ca'

if [ ! -e $tarball ]
then
    wget $url
    md5sum -c - <<< "$ha  $tarball" || (echo "Failed md5sum check!" && exit -1)
fi

mkdir $dirname
cd $dirname
tar xzf ../$tarball
mv $dirname src
prefix=$(pwd)
cd src

./configure --prefix=$prefix --enable-parallel && \
    make && \
    make install && \
    cd ../..

rm -r $dirname/src
