package main

import rl "vendor:raylib"

WINDOW_HEIGHT := i32(200)
WINDOW_WIDTH := i32(800)
FONT_SIZE := i32(67)

main :: proc() {
	rl.InitWindow(WINDOW_WIDTH, WINDOW_HEIGHT, "Billboard")
	defer rl.CloseWindow()

	rl.SetTargetFPS(60)

	text := cstring("Testing")
	text_width := rl.MeasureText(text, FONT_SIZE)
	text_pos_x := WINDOW_WIDTH

	for !rl.WindowShouldClose() {
		text_pos_x -= 2

		if text_pos_x < -text_width {
			text_pos_x = WINDOW_WIDTH
		}

		rl.BeginDrawing()
		rl.ClearBackground(rl.BLUE)

		rl.DrawText(text, text_pos_x, (WINDOW_HEIGHT - FONT_SIZE) / 2, FONT_SIZE, rl.WHITE)

		rl.EndDrawing()
	}
}
