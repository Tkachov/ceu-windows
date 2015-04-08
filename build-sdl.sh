if [ ! -d "SDL" ]; then
  echo "SDL directory missing"
  exit
fi

if [ ! -d "SDL_image" ]; then
  echo "SDL_image directory missing"
  exit
fi

if [ ! -d "SDL_mixer" ]; then
  echo "SDL_mixer directory missing"
  exit
fi

if [ ! -d "SDL_ttf" ]; then
  echo "SDL_ttf directory missing"
  exit
fi

if [ ! -d "SDL_net" ]; then
  echo "SDL_net directory missing"
  exit
fi

if [ ! -d "SDL2_gfx" ]; then
  echo "SDL2_gfx directory missing"
  exit
fi

echo "Building SDL:"
cd SDL
mkdir build
cd build
../configure
make
make install
cd ../..

echo "Building SDL_image:"
cd SDL_image
mkdir build
cd build
../configure
make
make install
cd ../..

echo "Building SDL_mixer:"
cd SDL_mixer
sed 's/^\( *BASE_CFLAGS *= *"[^"]*\)-mno-cygwin *\([^"]*"\)/\1\2/' -i configure
sed 's/^\( *BASE_LDFLAGS *= *"[^"]*\)-mno-cygwin *\([^"]*"\)/\1\2/' -i configure
mkdir build
cd build
../configure
make
make install
cd ../..

echo "Building SDL_ttf:"
cd SDL_ttf
mkdir build
cd build
../configure
make
make install
cd ../..

echo "Building SDL_net:"
cd SDL_net
mkdir build
cd build
../configure
make
make install
cd ../..

echo "Building SDL2_gfx:"
cd SDL2_gfx
mkdir build
cd build
../configure
make
make install
cd ../..

echo "Done."