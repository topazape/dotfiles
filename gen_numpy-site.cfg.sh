#!/bin/sh

cat << EOF > $HOME/.numpy-site.cfg
[openblas]
libraries = openblas
library_dirs = $HOME/.linuxbrew/opt/openblas/lib
include_dirs = $HOME/.linuxbrew/opt/openblas/include
runtime_library_dirs = $HOME/.linuxbrew/opt/openblas/lib
EOF
