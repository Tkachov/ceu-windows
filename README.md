## Céu on Windows

This repository contains a few scripts which could be used to set up Céu and SDL2 on Windows machine with Cygwin.

Proceed to [instructions](Instruction.md).

**TL;DR:**

1. Install [Cygwin](https://cygwin.com/) and the following packages using Cygwin installer:  
git, gcc, lua5.1, lua-lpeg 0.12, freetype2 (**x64 only**), libpng and zlib.

2. Download sources for SDL2, SDL2_image, SDL2_mixer, SDL2_ttf and SDL2_net from [SDL Mercurial](http://hg.libsdl.org/) repository and SDL2_gfx sources from its [site](http://cms.ferzkopp.net/index.php/software/13-sdl-gfx).  
Unpack them into directories "SDL2", "SDL_image", "SDL2_mixer", "SDL_ttf", "SDL_net", "SDL2_gfx".

3. Run **build-ceu.sh**.

4. Run **build-sdl.sh**.

5. Run **get-ceu-sdl.sh**.