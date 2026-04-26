#include <stdbool.h>

#include "raylib.h"

#define CIMGUI_DEFINE_ENUMS_AND_STRUCTS
#include "cimgui.h"
#include "rlImGui.h"

int main(void) {
    SetTraceLogLevel(LOG_NONE);

    InitWindow(800, 600, "Hello World");
    SetTargetFPS(120);

    rlImGuiSetup(true);

    bool active = true;
    int count = 0;

    while (!WindowShouldClose()) {
        BeginDrawing();
        {
            ClearBackground(RAYWHITE);

            DrawText("Hello World! :)", 190, 200, 20, LIGHTGRAY);

            rlImGuiBegin();
            {
                igBegin("Hello Window!", &active, 0);
                igText("Counter %d", count);
                if (igButton("Save", (ImVec2){0, 0})) 
                    count++;
                igEnd();
            }
            rlImGuiEnd();
        }
        EndDrawing();
    }

    rlImGuiShutdown();

    CloseWindow();

    return 0;
}
