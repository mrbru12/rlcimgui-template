# TODO: Make generated .o files go inside build/ dir to not clutter src/

BINARY  := main
CC      := gcc
CXX     := g++
 
THIRDPARTY_DIR := thirdparty
RAYLIB_DIR     := $(THIRDPARTY_DIR)/raylib
CIMGUI_DIR     := $(THIRDPARTY_DIR)/cimgui
RLIMGUI_DIR    := $(THIRDPARTY_DIR)/rlImGui

RAYLIB_LIB  := $(RAYLIB_DIR)/src/libraylib.a
CIMGUI_LIB  := $(CIMGUI_DIR)/libcimgui.a
RLIMGUI_OBJ := src/rlImGui.o
 
INCLUDES := \
    -Isrc \
    -I$(RAYLIB_DIR)/src \
    -I$(CIMGUI_DIR) \
    -I$(CIMGUI_DIR)/imgui \
    -I$(RLIMGUI_DIR)
 
CFLAGS := -Wall -Wextra $(INCLUDES)

LDFLAGS := \
    -L$(RAYLIB_DIR)/src -lraylib \
    -L$(CIMGUI_DIR) -lcimgui \
    -lm -lGL -lpthread -ldl -lX11
 
SRCS := $(wildcard src/*.c)
OBJS := $(SRCS:.c=.o)

BIN := bin/$(BINARY)
 
all: $(RAYLIB_LIB) $(CIMGUI_LIB) $(RLIMGUI_OBJ) $(BIN)
 
$(RAYLIB_LIB):
	$(MAKE) -C $(RAYLIB_DIR)/src PLATFORM=PLATFORM_DESKTOP
 
$(CIMGUI_LIB):
	$(MAKE) -C $(CIMGUI_DIR) static

$(RLIMGUI_OBJ): $(RLIMGUI_DIR)/rlImGui.cpp
	$(CXX) -O2 $(INCLUDES) -c $< -o $@ 

$(BIN): $(OBJS) $(RLIMGUI_OBJ) | bin
	$(CXX) $^ $(LDFLAGS) -o $@

bin:
	mkdir -p bin
 
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@
 
clean:
	rm -f $(OBJS)
	rm -rf bin

clean-all: clean
	rm -f $(RLIMGUI_OBJ)
	$(MAKE) -C $(RAYLIB_DIR)/src clean
	$(MAKE) -C $(CIMGUI_DIR) clean
 
.PHONY: all clean clean-all

