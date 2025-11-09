package main

import "core:fmt"
import toml "toml_parser"

ConfigData :: struct {
	text:         string,
	font_path:    string,
	font_size:    i32,
	font_spacing: f32,
	width:        i32,
	height:       i32,
}

load_config :: proc() -> ConfigData {
	section, err1 := toml.parse_file("config.toml", context.temp_allocator)

	if toml.print_error(err1) do fmt.panicf("Failed to parse config file")

	window_table, ok7 := toml.get_table(section, "window"); assert(ok7)
	text_table, ok8 := toml.get_table(section, "text"); assert(ok8)

	width, ok := toml.get_i64(window_table, "width"); assert(ok)
	height, ok2 := toml.get_i64(window_table, "height"); assert(ok2)
	font_size, ok3 := toml.get_i64(text_table, "font_size"); assert(ok3)
	font_path, ok4 := toml.get_string(text_table, "font_path"); assert(ok4)
	banner_text, ok5 := toml.get_string(text_table, "banner_text"); assert(ok5)
	font_spacing, ok6 := toml.get_f64(text_table, "font_spacing"); assert(ok6)

	config_data := ConfigData {
		text         = banner_text,
		font_path    = font_path,
		font_size    = i32(font_size),
		font_spacing = f32(font_spacing),
		width        = i32(width),
		height       = i32(height),
	}

	return config_data
}
