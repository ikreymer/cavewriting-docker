#!/bin/bash

export G3DINSTALLPATH=~/G3D/build/linux-x86_64-g++4.9/

export ICOMPILE=~/G3D/bin/icompile

cd ~/cavewriting/src/tinyxml.lib; $ICOMPILE .

cd ~/cavewriting/src/lib3ds.lib; $ICOMPILE .

cd ~/cavewriting/src/FTGL.lib; $ICOMPILE .

cd ~/cavewriting/src/VRG3D.lib; $ICOMPILE .

cd ~/cavewriting/src/cwapp; $ICOMPILE .

cp ~/cavewriting/src/cwapp/build/linux-x86_64-g++4.9/cwappd ~/cavewriting/bin/

sudo cp ~/cavewriting/src/fmod/lib/libfmodex.so /usr/lib/
