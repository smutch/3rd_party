url='http://www.fftw.org/fftw-3.3.5.tar.gz'
tarball=$(basename $url)
dirname=$(sed "s/\.tar\.gz//" <<< $(basename $url))
ha='6cc08a3b9c7ee06fdd5b9eb02e06f569'
nproc=4

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

arg_list="--prefix=$prefix --enable-type-prefix"
for args in "$arg_list" "$arg_list --enable-shared"; do
    ./configure $args --enable-mpi && \
        make -j$nproc && \
        make install && \
        make clean && \
        ./configure $args --enable-mpi --enable-float && \
        make -j$nproc && \
        make install && \
        make clean \
        || echo "BUILD FAILED!"
done

cd ../.. &&
rm -r $dirname/src
