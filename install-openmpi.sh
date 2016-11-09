url='https://www.open-mpi.org/software/ompi/v2.0/downloads/openmpi-2.0.1.tar.gz'
tarball=$(basename $url)
dirname=$(sed "s/\.tar\.gz//" <<< $(basename $url))
ha='bfd298d833fd2f3394c0e5ae831017be'

if [ ! -e $tarball ]
then
    wget $url
fi

md5sum -c - <<< "$ha  $tarball" || (echo "Failed md5sum check!" && exit -1)

mkdir $dirname
cd $dirname
tar xzf ../$tarball
mv $dirname src
prefix=$(pwd)
cd src

./configure --prefix=$prefix
make
make install
cd ../..

rm -r $dirname/src
