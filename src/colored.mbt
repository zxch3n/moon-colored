///|
typealias List[A] = @immut/list.T[A]

///| 
struct Colored {
  str : String
  bg_color : Color?
  color : Color?
  formats : @immut/list.T[Format]
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
pub fn output(self : Colored, logger : &Logger) -> Unit {
  logger.write_string(self.to_string())
}

///|
pub fn Colored::to_string(self : Colored) -> String {
  let mut styles = List::Nil
  match self.color {
    Some(color) => styles = List::Cons(to_color_code(color), styles)
    None => ()
  }
  match self.bg_color {
    Some(bg_color) => styles = List::Cons(to_bg_color_code(bg_color), styles)
    None => ()
  }
  let mut formats = self.formats
  loop formats {
    List::Cons(format, rest) => {
      formats = rest
      match format {
        Bold => styles = List::Cons("1", styles)
        Underline => styles = List::Cons("4", styles)
        Blink => styles = List::Cons("5", styles)
        Inverse => styles = List::Cons("7", styles)
        Hidden => styles = List::Cons("8", styles)
        Strikethrough => styles = List::Cons("9", styles)
        Italic => styles = List::Cons("3", styles)
      }
      continue rest
    }
    List::Nil => ()
  }
  match styles {
    List::Cons(_, _) => {
      let mut ans = "["
      loop styles {
        List::Cons(style, rest) => {
          styles = rest
          if ans.length() == 0 {
            ans = style
          } else {
            ans = ans + ";" + style
          }
          continue rest
        }
        List::Nil => ()
      }
      ans + "m" + self.str + "[0m"
    }
    List::Nil => self.str
  }
}

///|
fn to_color_code(self : Color) -> String {
  match self {
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
fn to_bg_color_code(self : Color) -> String {
  match self {
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
pub fn Colored::new(str : String) -> Colored {
  { str, bg_color: None, color: None, formats: List::Nil }
}

///|
pub fn red(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: Some(Red),
    formats: self.formats,
  }
}

///|
pub fn bg_red(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: Some(Red),
    color: self.color,
    formats: self.formats,
  }
}

///|
pub fn yellow(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: Some(Yellow),
    formats: self.formats,
  }
}

///|
pub fn bg_yellow(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: Some(Yellow),
    color: self.color,
    formats: self.formats,
  }
}

///|
pub fn green(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: Some(Green),
    formats: self.formats,
  }
}

///|
pub fn bg_green(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: Some(Green),
    color: self.color,
    formats: self.formats,
  }
}

///|
pub fn blue(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: Some(Blue),
    formats: self.formats,
  }
}

///|
pub fn bg_blue(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: Some(Blue),
    color: self.color,
    formats: self.formats,
  }
}

///|
pub fn magenta(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: Some(Magenta),
    formats: self.formats,
  }
}

///|
pub fn bg_magenta(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: Some(Magenta),
    color: self.color,
    formats: self.formats,
  }
}

///|
pub fn cyan(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: Some(Cyan),
    formats: self.formats,
  }
}

///|
pub fn bg_cyan(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: Some(Cyan),
    color: self.color,
    formats: self.formats,
  }
}

///|
pub fn white(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: Some(White),
    formats: self.formats,
  }
}

///|
pub fn bg_white(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: Some(White),
    color: self.color,
    formats: self.formats,
  }
}

///|
pub fn black(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: Some(Black),
    formats: self.formats,
  }
}

///|
pub fn bg_black(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: Some(Black),
    color: self.color,
    formats: self.formats,
  }
}

///|
pub fn default_color(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: Some(Default),
    formats: self.formats,
  }
}

///|
pub fn default_bg_color(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: Some(Default),
    color: self.color,
    formats: self.formats,
  }
}

///|
pub fn bold(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: self.color,
    formats: List::Cons(Bold, self.formats),
  }
}

///|
pub fn underline(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: self.color,
    formats: List::Cons(Underline, self.formats),
  }
}

///|
pub fn blink(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: self.color,
    formats: List::Cons(Blink, self.formats),
  }
}

///|
pub fn inverse(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: self.color,
    formats: List::Cons(Inverse, self.formats),
  }
}

///|
pub fn hidden(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: self.color,
    formats: List::Cons(Hidden, self.formats),
  }
}

///|
pub fn strikethrough(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: self.color,
    formats: List::Cons(Strikethrough, self.formats),
  }
}

///|
pub fn italic(self : Colored) -> Colored {
  {
    str: self.str,
    bg_color: self.bg_color,
    color: self.color,
    formats: List::Cons(Italic, self.formats),
  }
}
