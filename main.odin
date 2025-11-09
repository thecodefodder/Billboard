package main

import "core:strings"
import rl "vendor:raylib"

WINDOW_HEIGHT := i32(200)
WINDOW_WIDTH := i32(800)
FONT_SIZE := i32(67)

main :: proc() {
	config := load_config()

	rl.InitWindow(WINDOW_WIDTH, WINDOW_HEIGHT, "Billboard")
	defer rl.CloseWindow()

	rl.SetTargetFPS(60)

	text := strings.clone_to_cstring(config.text, context.temp_allocator)
	text_width := rl.MeasureText(text, FONT_SIZE)
	text_pos_x := WINDOW_WIDTH

	font: rl.Font
	if config.font_path != "" {
		fp := strings.clone_to_cstring(config.font_path, context.temp_allocator)
		font = rl.LoadFontEx(fp, config.font_size, nil, 0)
	} else {
		font = rl.GetFontDefault()
	}

	for !rl.WindowShouldClose() {
		text_pos_x -= 2

		if text_pos_x < -text_width {
			text_pos_x = WINDOW_WIDTH
		}

		rl.BeginDrawing()
		rl.ClearBackground(rl.BLUE)

		pos := rl.Vector2{f32(text_pos_x), f32((WINDOW_HEIGHT - FONT_SIZE) / 2)}
		rl.DrawTextEx(font, text, pos, f32(FONT_SIZE), config.font_spacing, rl.WHITE)

		rl.EndDrawing()
	}
}
