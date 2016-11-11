export THIRDPARTY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function add_lib()
{
    export PATH="$1/bin:$PATH"
    export LD_LIBRARY_PATH="$1/lib:$LD_LIBRARY_PATH"
    export LIBRARY_PATH="$1/lib:$LIBRARY_PATH"
    export C_INCLUDE_PATH="$1/include:$C_INCLUDE_PATH"
}

function add_bin()
{
    export PATH="$1/bin:$PATH"
}

add_lib "$THIRDPARTY/libevent-2.0.22-stable"
add_bin "$THIRDPARTY/tmux-2.3"
add_lib "$THIRDPARTY/openmpi-2.0.1"
add_lib "$THIRDPARTY/hdf5-1.8.17"
add_lib "$THIRDPARTY/fftw-3.3.5"
add_lib "$THIRDPARTY/gsl-2.2.1"

# GBPcode
# GBP_SRC=/coepp/cephfs/borg/data/smutch/3rd_party/gbpCode/myLib/mpi
# export LD_LIBRARY_PATH="${GBP_SRC}:$LD_LIBRARY_PATH"
# export LIBRARY_PATH="${GBP_SRC}:$LIBRARY_PATH"
# export C_INCLUDE_PATH="${GBP_SRC}:$C_INCLUDE_PATH"
