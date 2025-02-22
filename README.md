# Moon Colored

A chainable terminal text styling library for MoonBit. Add colors, background
colors, and text formatting to your terminal output.

[Placeholder for demo image]

```moonbit
println(Colored::new("Hello World!").blue())
println(Colored::new("Hello World!").bg_blue())
println(Colored::new("Hello World!").bg_blue().bold())
println(Colored::new("Hello World!").red())
println(Colored::new("Hello World!").red().bold())
println(Colored::new("Hello World!").underline().strikethrough())
println(Colored::new("Hello World!").hidden())
println(Colored::new("Hello World!").magenta())
println(Colored::new("Hello World!").inverse())
```

## Installation

```bash
moon add zxch3n/colored
```

## Usage

```moonbit
// Basic usage
println(@colored.Colored::new("Hello, World!").red())
// Combine multiple styles
println(
  @colored.Colored::new("Important Warning!")
    .yellow()
    .bg_red()
    .bold()
    .underline()
)

// Chain different formatting options
println(
  @colored.Colored::new("Styled Text")
    .blue()
    .italic()
    .underline()
)
```

## API Reference

### Colors

Text colors:

- `black()`
- `red()`
- `green()`
- `yellow()`
- `blue()`
- `magenta()`
- `cyan()`
- `white()`
- `default_color()`

Background colors:

- `bg_black()`
- `bg_red()`
- `bg_green()`
- `bg_yellow()`
- `bg_blue()`
- `bg_magenta()`
- `bg_cyan()`
- `bg_white()`
- `default_bg_color()`

### Text Formatting

- `bold()` - Make text bold
- `italic()` - Make text italic
- `underline()` - Add underline
- `blink()` - Make text blink
- `inverse()` - Swap foreground and background colors
- `hidden()` - Hide the text
- `strikethrough()` - Add strikethrough to text
