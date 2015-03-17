defmodule Learning do
  def longest_word(string) do
    String.split(string) |> Enum.max_by(&String.length/1)
  end

  def sum_nums(num, acc \\ 0)
  def sum_nums(0, acc), do: acc
  def sum_nums(num, acc) do
    sum_nums(num - 1, acc + num)
  end

  def time_conversion(minutes) do
    "#{div(minutes, 60)}:#{rem(minutes, 60)}"
  end

  def count_vowels(string) do
    vowels = Enum.into(["a", "e", "i", "o", "u"], HashSet.new)
    String.split(string, "") |> Enum.reduce(0, fn(char, acc) ->
      if Set.member?(vowels, char), do: acc + 1, else: acc
    end)
  end
  
  def palindrome?(string), do: String.to_char_list(string) |> is_palindrome?
  def is_palindrome?(char_list) when length(char_list) < 2, do: true
  def is_palindrome?(char_list) do
    if Enum.at(char_list, 0) != Enum.at(char_list, -1) do
      false
    else
      List.delete_at(char_list, 0) |> List.delete_at(-1) |> is_palindrome?
    end
  end

  def a_palindrome?(string) do
    chars = String.to_char_list(string)
    cond do
      String.length(string) < 2 -> true
      Enum.at(chars, 0) != Enum.at(chars, -1) -> false
      true -> List.delete_at(chars, 0) |> List.delete_at(-1) |> List.to_string |> palindrome?
    end
  end

  def nearby_az?(string) do
    String.split(string, "") |> Enum.reduce({4, false}, fn(letter, {since_a, nearby_az}) ->
      case letter do
        "a" -> {0, nearby_az}
        "z" -> if since_a < 4, do: {since_a, true}
         _  -> {since_a, nearby_az}
      end
    end) |> elem(1)
  end

  def two_sum_zero(list) do
    with_indexes = Enum.with_index(list)
    for {n1, i1} <- with_indexes do
      for {n2, i2} <- Enum.drop(with_indexes, i1 + 1) do
        if n1 + n2 == 0, do: {i1, i2}
      end
    end |> List.flatten |> Enum.reject(&is_nil/1)
  end

  def is_power_of_two?(1), do: true
  def is_power_of_two?(num) when rem(num, 2) == 0 do
    is_power_of_two?(div(num, 2))
  end
  def is_power_of_two?(num) when rem(num, 2) != 0, do: false

  def third_greatest(list) do
    Enum.sort(list) |> Enum.at(2)
  end

  def most_common_letters(string) do
    Enum.reduce(String.split(string, "", trim: true), %{}, fn(char, count_hash) ->
      Dict.update(count_hash, char, 1, fn(count) -> count + 1 end)
    end) > Enum.max_by(fn(tup) -> elem(tup,1) end)
  end
  
  def dasherize_number(number, string \\ "") do
    new_string = rem(number, 10) |> dash_helper(string)
    if number > 10 do
      dasherize_number(div(number, 10), new_string)
    else
      String.strip(new_string, ?-)
    end
  end

  def dash_helper(num, string) when rem(num, 2) == 1 do
    num_str = Integer.to_string(num)
    if String.at(string, 0) == "-" do
      "-#{num_str}" <> string
    else
      "-#{num_str}-" <> string
    end
  end

  def dash_helper(num, string) when rem(num, 2) == 0, do: Integer.to_string(num) <> string

  def capitalize(string) do
    for word <- String.split(string) do 
      String.upcase(String.at(word, 0)) <> String.slice(word, 1..-1)
    end |> Enum.join(" ")
  end

  def scramble_string(string, positions) do
    Enum.reduce(positions, "", fn(pos, new_string) -> new_string <> String.at(string, pos) end)
  end
  
  def is_prime?(n, divisor \\ 2) 
  def is_prime?(number, _) when number < 2, do: false
  def is_prime?(number, divisor) do
    cond do
      divisor > div(number, 2) -> true
      rem(number, divisor) == 0 -> false
      true -> is_prime?(number, divisor + 1)
    end
  end

  def nth_prime(n, counter \\ 2) do
    cond do
      is_prime?(counter) ->
        if n == 1, do: counter, else: nth_prime(n - 1, counter + 1)
      true ->
        nth_prime(n, counter + 1)
    end
  end

  def fizzbuzz do
    Enum.map(1..100, fn(num) ->
      str = ""
      if rem(num, 3) == 0, do: str = str <> "Fizz"
      if rem(num, 5) == 0, do: str = str <> "Buzz"
      if(String.length(str) > 0, do: str, else: num)
      |> IO.puts
    end)
  end
end
