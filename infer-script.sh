#!/bin/bash

set -ev

# Install Opaml
wget https://github.com/ocaml/opam/releases/download/2.0.7/opam-2.0.7-x86_64-Linux -O opam
chmod ugo+x opam
./opam init --yes --comp=4.01.0
eval `./opam config env`
./opam install --yes sawja.1.5.8 atdgen.2.2.1 javalib.2.3a extlib.1.7.7 #(then say 'y' to the question)

# Install infer (latest version)
git clone https://github.com/facebook/infer.git
cd infer/
make -C infer java
export PATH=`pwd`/infer/bin:$PATH
cd ../
