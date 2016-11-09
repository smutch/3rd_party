url='http://www.fftw.org/fftw-3.3.5.tar.gz'
tarball=$(basename $url)
dirname=$(sed "s/\.tar\.gz//" <<< $(basename $url))
ha='6cc08a3b9c7ee06fdd5b9eb02e06f569'

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

args="--prefix=$prefix --enable-type-prefix"
./configure $args --enable-mpi && \
    make && \
    make install && \
    make clean && \
    ./configure $args --enable-mpi --enable-float && \
    make && \
    make install && \
    make clean && \
    ./configure $args && \
    make && \
    make install && \
    make clean && \
    ./configure $args --enable-float && \
    make && \
    make install && \
    make clean && \
    cd ../.. &&
    rm -r $dirname/src || (echo "BUILD FAILED!"; cd ../..)
