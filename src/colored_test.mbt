///|
test "colored" {
  println(Colored::new("Hello World!").blue())
  println(Colored::new("Hello World!").bg_blue())
  println(Colored::new("Hello World!").bg_blue().bold())
  println(Colored::new("Hello World!").red())
  println(Colored::new("Hello World!").red().bold())
  println(Colored::new("Hello World!").underline().strikethrough())
  println(Colored::new("Hello World!").hidden())
  println(Colored::new("Hello World!").magenta())
  println(Colored::new("Hello World!").inverse())
}
