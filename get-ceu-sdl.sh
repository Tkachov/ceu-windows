git clone https://github.com/fsantanna/ceu-sdl
cd ceu-sdl/
git checkout v0.8

sed 's/\(-lSDL2\b\)/-I\/usr\/local\/include\/SDL2 -I\/usr\/local\/include -I\/usr\/include\/mingw -L\/usr\/local\/lib -lcygwin -lSDL2main -mwindows \1/' -i Makefile

make CEUFILE=samples/sdl1.ceu
./samples/sdl1.exe