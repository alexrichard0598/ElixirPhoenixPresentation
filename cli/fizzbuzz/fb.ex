defmodule FizzBuzz do
  def play(min, max), do: Enum.each(min..max, &play/1)
  def play(num) when rem(num, 15) == 0, do: IO.puts Color.green("FizzBuzz")
  def play(num) when rem(num, 3) == 0, do: IO.puts Color.red("Fizz")
  def play(num) when rem(num, 5) == 0, do: IO.puts Color.blue("Buzz")
  def play(num), do: IO.puts num
end

# Coloring module
defmodule Color do
  def green(text) do
    IO.ANSI.green <> text <> IO.ANSI.reset()
  end
  def red(text) do
    IO.ANSI.red <> text <> IO.ANSI.reset()
  end
  def blue(text) do
    IO.ANSI.blue <> text <> IO.ANSI.reset()
  end
end
