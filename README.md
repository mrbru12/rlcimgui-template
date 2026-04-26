
# rlcimgui-template

A project template in C for Raylib + Dear ImGui.

## Introduction

This template is meant to serve as quick way of setting up a C project (no stinky C++!) using [Dear ImGui](https://github.com/ocornut/imgui) with [Raylib](https://github.com/raysan5/raylib) as a backend, which has proven to be quite a boring (and somewhat complex) thing to do due to some pesky compilation problems that might arise. g++ is used to build ImGui related stuff, but after that everything uses plain gcc! :)

## Submodules

To use ImGui in C with Raylib we need 3 libraries. All of them are already included in the project [thirdparty/](./thirdparty) folder as git submodules:
- **Raylib**: version 6.0
- **[cimgui](https://github.com/cimgui/cimgui/tree/docking_inter)**: targeting ImGui 1.92.7
    - ImGui 1.92.7 itself is included as a nested submodule inside cimgui
- **[rlImGui](https://github.com/raylib-extras/rlImGui/tree/main)**: targeting ImGui 1.92.1
> There are some version mismatches, but they don't seem to break anything. I prioritized using the latest version over strict matches for everything.

## Build

```bash
$ git clone --recurse-submodules https://github.com/mrbru12/rlcimgui-template.git
```
> The --recurse-submodules flag is needed to clone all the submodules. If you cloned without it, run `git submodule update --init --recursive`.
```bash
$ cd cozy-books
```
```bash
$ make
```
 
