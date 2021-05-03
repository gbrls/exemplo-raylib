# Este comando funciona
# gcc .\core\core_2d_camera_platformer.c -D_DEFAULT_SOURCE -s -I . -I ..\src\ -I ..\src\external\ -L . -L ..\src\ -lraylib -lopengl32 -lgdi32 -lwinmm -static
# Algo que n├úo funcionou muito bem foi que deixando os alunos livres para compilarem o projeto da forma que quiserem, ficou tudo muito bagun├ºado e eles mesmo se atrapalharam, apesar de ser meio chato, n├│s temos que tomar a postura de "we know what's best for you" e obrigar a usar este novo makefile, que ser├í uma solu├º├úo "all in one"

# game code directory name
GAMEDIR := src

# binary output directory name
OUTPUTDIR := bin

# name for the output(binary) of the game code
GAMENAME := game


# Raylib path
RP := C:/raylib

# if you want debug information about memory e.g. memory leaks use -fsanitize=address
# add C flags, like: CFLAGS := -Wall -Werror -Wconversion -Wextra
CFLAGS :=  -D_DEFAULT_SOURCE -s -I . -I $(RP)\src\ -I $(RP)\src\external\ -L . -L $(RP)\src\ -lraylib -lopengl32 -lgdi32 -lwinmm -static

# add load flags, others like -pthread
LDLIB := -lm 

CC := gcc -std=c17
RM := rm -f
MK := mkdir -p

EXT := c

GAMESOURCES := $(shell find $(GAMEDIR) -type f -name *.$(EXT))
GAMEOBJS := $(subst .$(EXT),.o,$(GAMESOURCES))


all: buildGAME runGAME
build: buildGAME 
run: runGAME


buildGAME:
	$(CC) -o $(OUTPUTDIR)/$(GAMENAME) ./src/*.c $(LDLIB) $(CFLAGS)

mkdirs:
	$(MK) $(OUTPUTDIR)

runGAME:
	./$(OUTPUTDIR)/$(GAMENAME)

