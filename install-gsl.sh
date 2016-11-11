url='http://mirror.aarnet.edu.au/pub/gnu/gsl/gsl-2.2.1.tar.gz'
sig_url='http://mirror.aarnet.edu.au/pub/gnu/gsl/gsl-2.2.1.tar.gz.sig'
tarball=$(basename $url)
dirname=$(sed "s/\.tar\.gz//" <<< $(basename $url))
gpg_key_url='https://www.gnu.org/software/gsl/key/gsl_key.txt'

if [ ! -e $tarball ]
then
    wget $url
    wget $sig_url
    wget $gpg_key_url
    gpg --import $(basename $gpg_key_url) && gpg --verify $(basename $sig_url) || (echo "Failed gpg signature check!" && exit -1)
fi

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
