CC= clang++
FRAMEWORKS= -framework Cocoa -framework OpenGL -framework IOKit
CFLAGS= -std=c++17
DEBUGCFLAGS= -Wall -D DEBUG -g
LIBS= -lglfw3 -lGLEW
OUTPUT= bin/app
WINOUT= bin/win64App.exe
DEPENDENCIES= src/renderingHead/shader.cpp src/renderingHead/texture.cpp  src/renderingHead/objloader.cpp  src/renderingHead/vboindexing.cpp
GAME= src/game/game.cpp src/game/head/controls.cpp src/game/head/model.cpp
MAIN= src/main.cpp
MLIBFOLDER= -L./libs/macos
wLIBFOLDER= -L./libs/win32




macos: $(MAIN) $(DEPENDENCIES)
	$(CC) $(CFLAGS) $(DEBUGCFLAGS) -o $(OUTPUT) $(MAIN) $(GAME) $(DEPENDENCIES) $(MLIBFOLDER) $(LIBS) $(FRAMEWORKS)

test: macos
	
	./bin/app

cleanup:
	rm -rf bin/app
	rm -rf /log/log.LOG

run:
	./bin/app


