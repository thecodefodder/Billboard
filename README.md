# Billboard

## What is is?

A scrolling billboard built using Raylib and Odin. I wrote it for my stream so people know what's going on.

## Dependencies

- [Odin](https://odin-lang.org/)

## How to build

```bash
mkdir -p build
odin build . -out:build/billboard
```

## Configuration

```toml
[window]
width = 800 # the width of the window
height = 200 # the height of the window

[text]
banner_text= "Hello, World!" # The text that will scroll in the window
font_size = 67 # the font size
font_path = "/usr/share/fonts/TTF/IosevkaNerdFont-Regular.ttf" # the path to the font you wish to use. If this is empty, a default will be used
font_spacing = 8.0 # The spacing between characters. Some fonts need some spacing to stop overlap
```
