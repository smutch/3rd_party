url='https://github.com/tmux/tmux/releases/download/2.3/tmux-2.3.tar.gz'
tarball=$(basename $url)
dirname=$(sed "s/\.tar\.gz//" <<< $(basename $url))

if [ ! -e $tarball ]
then
    wget $url
fi

mkdir $dirname
cd $dirname
tar xzf ../$tarball
mv $dirname src
prefix=$(pwd)
cd src

./configure --prefix=$prefix && \
    make && \
    make install &&  \
    cd ../.. && \
    rm -r $dirname/src || (echo "BUILD FAILED!"; cd ../..)
