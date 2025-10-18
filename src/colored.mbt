///|
typealias @list.List[A] as List[A]

///| 
struct Colored {
  str : String
  bg_color : Color?
  color : Color?
  formats : List[Format]
}

///|
priv enum Format {
  Bold
  Underline
  Blink
  Inverse
  Hidden
  Strikethrough
  Italic
}

///|
priv enum Color {
  Black
  Red
  Green
  Yellow
  Blue
  Magenta
  Cyan
  White
  Default
}

///|
pub fn Colored::output(self : Colored, logger : &Logger) -> Unit {
  logger.write_string(self.to_string())
}

///|
pub fn Colored::to_string(self : Colored) -> String {
  let { str, bg_color, color, formats } = self
  let mut styles : List[String] = @list.empty()
  match color {
    Some(color) => styles = styles.prepend(to_color_code(color))
    None => ()
  }
  match bg_color {
    Some(bg_color) => styles = styles.prepend(to_bg_color_code(bg_color))
    None => ()
  }
  let mut remaining_formats = formats
  loop remaining_formats {
    List::More(format, tail=rest) => {
      remaining_formats = rest
      styles = styles.prepend(format_to_code(format))
      continue rest
    }
    List::Empty => ()
  }
  let mut ans = "["
  let mut style_count = 0
  let mut remaining_styles = styles
  loop remaining_styles {
    List::More(code, tail=rest) => {
      remaining_styles = rest
      if style_count == 0 {
        ans = ans + code
      } else {
        ans = ans + ";" + code
      }
      style_count = style_count + 1
      continue rest
    }
    List::Empty => ()
  }
  if style_count == 0 {
    str
  } else {
    ans + "m" + str + "[0m"
  }
}

///|
pub impl Show for Colored with output(self, logger) {
  Colored::output(self, logger)
}

///|
fn to_color_code(color : Color) -> String {
  match color {
    Black => "30"
    Red => "31"
    Green => "32"
    Yellow => "33"
    Blue => "34"
    Magenta => "35"
    Cyan => "36"
    White => "37"
    Default => "39"
  }
}

///|
fn to_bg_color_code(color : Color) -> String {
  match color {
    Black => "40"
    Red => "41"
    Green => "42"
    Yellow => "43"
    Blue => "44"
    Magenta => "45"
    Cyan => "46"
    White => "47"
    Default => "49"
  }
}

///|
fn format_to_code(format : Format) -> String {
  match format {
    Bold => "1"
    Underline => "4"
    Blink => "5"
    Inverse => "7"
    Hidden => "8"
    Strikethrough => "9"
    Italic => "3"
  }
}

///|
pub fn Colored::new(str : String) -> Colored {
  { str, bg_color: None, color: None, formats: @list.empty() }
}

///|
pub fn Colored::red(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: Some(Red),
    formats: self.formats,
  }
}

///|
pub fn Colored::bg_red(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: Some(Red),
    color: self.color,
    formats: self.formats,
  }
}

///|
pub fn Colored::yellow(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: Some(Yellow),
    formats: self.formats,
  }
}

///|
pub fn Colored::bg_yellow(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: Some(Yellow),
    color: self.color,
    formats: self.formats,
  }
}

///|
pub fn Colored::green(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: Some(Green),
    formats: self.formats,
  }
}

///|
pub fn Colored::bg_green(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: Some(Green),
    color: self.color,
    formats: self.formats,
  }
}

///|
pub fn Colored::blue(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: Some(Blue),
    formats: self.formats,
  }
}

///|
pub fn Colored::bg_blue(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: Some(Blue),
    color: self.color,
    formats: self.formats,
  }
}

///|
pub fn Colored::magenta(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: Some(Magenta),
    formats: self.formats,
  }
}

///|
pub fn Colored::bg_magenta(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: Some(Magenta),
    color: self.color,
    formats: self.formats,
  }
}

///|
pub fn Colored::cyan(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: Some(Cyan),
    formats: self.formats,
  }
}

///|
pub fn Colored::bg_cyan(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: Some(Cyan),
    color: self.color,
    formats: self.formats,
  }
}

///|
pub fn Colored::white(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: Some(White),
    formats: self.formats,
  }
}

///|
pub fn Colored::bg_white(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: Some(White),
    color: self.color,
    formats: self.formats,
  }
}

///|
pub fn Colored::black(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: Some(Black),
    formats: self.formats,
  }
}

///|
pub fn Colored::bg_black(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: Some(Black),
    color: self.color,
    formats: self.formats,
  }
}

///|
pub fn Colored::default_color(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: Some(Default),
    formats: self.formats,
  }
}

///|
pub fn Colored::default_bg_color(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: Some(Default),
    color: self.color,
    formats: self.formats,
  }
}

///|
pub fn Colored::bold(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: self.color,
    formats: self.formats.prepend(Bold),
  }
}

///|
pub fn Colored::underline(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: self.color,
    formats: self.formats.prepend(Underline),
  }
}

///|
pub fn Colored::blink(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: self.color,
    formats: self.formats.prepend(Blink),
  }
}

///|
pub fn Colored::inverse(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: self.color,
    formats: self.formats.prepend(Inverse),
  }
}

///|
pub fn Colored::hidden(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: self.color,
    formats: self.formats.prepend(Hidden),
  }
}

///|
pub fn Colored::strikethrough(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: self.color,
    formats: self.formats.prepend(Strikethrough),
  }
}

///|
pub fn Colored::italic(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: self.color,
    formats: self.formats.prepend(Italic),
  }
}
