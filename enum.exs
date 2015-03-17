defmodule MyEnum do
  # def each(list, func) when is_list(list) do
  #   case list do
  #     [] -> nil
  #     _  ->
  #       func.(hd list)
  #       each(tl(list), func)
  #   end
  # end

  def each([], func) do nil end
  def each(list, func) do
    func.(hd(list))
    each(tl(list), func)
  end

  # def map(list, func, mapped \\ []) when is_list(list) do
  #   case list do
  #     [] -> mapped
  #     _ ->
  #       map(tl(list), func, mapped ++ [func.(hd(list))])
  #   end
  # end

  def map(_, _, mapped \\[])
  def map([], _, mapped) do mapped end

  def map([head | tail], func, mapped) do
    map tail, func, mapped ++ [func.(head)]
  end

  def sum(_, accumulator \\ 0)
  def sum([], accumulator) do accumulator end

  def sum([head | tail], accumulator) do
    sum(tail, head + accumulator)
  end
end
