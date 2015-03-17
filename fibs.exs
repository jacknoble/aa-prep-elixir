defmodule Euler do
  import Enum
  require Integer
  require Stream

  def fibs(0), do: []
  def fibs(1), do: [1] 
  def fibs(2), do: [1, 0]
  def fibs(num) do
    lower_fibs = fibs(num - 1)
    [sum(take(lower_fibs, 2)) | lower_fibs ]
  end

  def fastfibs(0, list), do: list
  def fastfibs(num, []), do: fastfibs(num - 2, [1,0])
  def fastfibs(num, list) do
    next = sum(take(list, 2))
    fastfibs(num - 1, [next | list])
  end

  def evenfibssum(acc \\ 0, fib \\ 1, lastfib \\ 0)
  def evenfibssum(acc, fib, lastfib) when fib < 4_000_000 do
    acc = if Integer.is_even(fib), do: acc + fib, else: acc
    evenfibssum(acc, fib + lastfib, fib)
  end
  def evenfibssum(acc, fib, lastfib) when fib >= 4_000_000, do: acc
end

