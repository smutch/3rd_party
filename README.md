3rd_party libraries
===================

A collection of scripts to install commonly needed 3rd party libraries.
Sometimes these libraries aren't present on an HPC machine, they ae configured
for your needs, or the versions which are there are simply too old.  Rather
than getting a sys admin to install/update them, it's often easier to just bite
the bullet and do it yourself!

To install a library, simply source the corresponding script.  Note that you may wish to modify build flags etc. first:

```bash
source ./install-hdf5.sh
```

A `source_me.sh` script is also included to simplify adding these libraries to your `PATH`, `LD_LIBRARY_PATH`, `C_INCLUDE_PATH` etc.  Modify this to suit your needs and then add then source it in your `.bash_profile`/`.zprofile`.
