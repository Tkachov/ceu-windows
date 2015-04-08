## Installing Cygwin and necessary packages

Install [Cygwin](https://cygwin.com/) and the following packages using Cygwin installer:  
curl, freetype2, g++, gcc, git, libpng, lua-lpeg 0.12, lua5.1, make, unzip and zlib.

**Warning:** freetype2 Cygwin package is available for x64 only, so you can't build SDL2_ttf on x86 and use it in your project.

**Note:** you don't need curl and unzip if you're going to download SDL sources on your own. These are needed only for **download-sdl.sh**.

(You should also install [IJG](http://www.ijg.org/) and [SGI TIFF](ftp://ftp.sgi.com/graphics/tiff/) libraries to get JPEG and TIFF support in SDL2_image. I didn't, so you have to figure it out on your own, but it should be as simple as installing necessary packages in Cygwin or building those from sources using instructions on their sites.)

## Building Céu

Build Céu like that (you can use **build-ceu.sh** to do that):

	git clone https://github.com/fsantanna/ceu
	cd ceu/
	git checkout v0.8
	lua pak.lua
	cp ceu /usr/local/bin/

## Building SDL libraries

Download sources for these libraries from [SDL Mercurial](http://hg.libsdl.org/) repository:  
SDL2, SDL2_image, SDL2_mixer, SDL2_ttf and SDL2_net.

Download SDL2_gfx sources from its [site](http://cms.ferzkopp.net/index.php/software/13-sdl-gfx).

Unpack them into directories "SDL", "SDL_image", "SDL_mixer", "SDL_ttf", "SDL_net", "SDL2_gfx".

(This step can be done using **download-sdl.sh**.)

In SDL2_mixer **configure** file remove *-mno-cygwin* flag from *BASE_CFLAGS* and *BASE_LDFLAGS* variables.

Build every SDL library like that:

	cd SDL          # folder with library sources
	mkdir build
	cd build
	../configure
	make
	make install    # you don't need sudo within Cygwin

(You can run **build-sdl.sh** to do it.)

## Using Céu

To check that everything works you can build some samples (you can to that using **get-ceu-sdl.sh**).

Download it:

	git clone https://github.com/fsantanna/ceu-sdl
	cd ceu-sdl/
	git checkout v0.8

Update **Makefile**:

	sed 's/\(-lSDL2\b\)/-I\/usr\/local\/include\/SDL2 -I\/usr\/local\/include -I\/usr\/include\/mingw -L\/usr\/local\/lib -lcygwin -lSDL2main -mwindows \1/' -i Makefile

Use make to build a sample:

	make CEUFILE=samples/sdl1.ceu
	./samples/sdl1.exe