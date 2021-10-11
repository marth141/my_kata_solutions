defmodule TestSpace do
  @moduledoc """
  Documentation for `TestSpace`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> TestSpace.hello()
      :world

  """
  def hello do
    :world
  end
end

defmodule Whicharein do
  @moduledoc """
  Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are substrings of strings of a2.

  Example 1:
  a1 = ["arp", "live", "strong"]

  a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

  returns ["arp", "live", "strong"]

  Example 2:
  a1 = ["tarp", "mice", "bull"]

  a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

  returns []

  Notes:
  Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.
  In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.
  Beware: r must be without duplicates.
  """
  def in_array(array_1, array_2) do
    Enum.filter(array_1, fn word_1 ->
      Enum.find_value(array_2, fn word_2 ->
        String.match?(word_2, ~r/#{word_1}/)
      end)
    end)
    |> Enum.sort()
  end
end

defmodule CountBits do
  @moduledoc """
  Write a function that takes an integer as input, and returns the number of bits that are equal to one in the binary representation of that number. You can guarantee that input is non-negative.

  Example: The binary representation of 1234 is 10011010010, so the function should return 5 in this case
  """
  def bits(n) do
    Integer.digits(n, 2)
    |> Enum.filter(fn number -> number != 0 end)
    |> length()
  end
end

defmodule Kata do
  @moduledoc """
  Trolls are attacking your comment section!

  A common way to deal with this situation is to remove all of the vowels from the trolls' comments, neutralizing the threat.

  Your task is to write a function that takes a string and return a new string with all vowels removed.

  For example, the string "This website is for losers LOL!" would become "Ths wbst s fr lsrs LL!".

  Note: for this kata y isn't considered a vowel.
  """
  def disemvowel(s) do
    s
    |> String.codepoints()
    |> Enum.map(fn letter ->
      case String.downcase(letter) do
        "a" ->
          ""

        "e" ->
          ""

        "i" ->
          ""

        "o" ->
          ""

        "u" ->
          ""

        _ ->
          letter
      end
    end)
    |> List.to_string()
  end
end

defmodule Kata do
  @moduledoc """
  Your task is to make a function that can take any non-negative integer as an argument and return it with its digits in descending order. Essentially, rearrange the digits to create the highest possible number.

  Examples:
  Input: 42145 Output: 54421

  Input: 145263 Output: 654321

  Input: 123456789 Output: 987654321
  """
  def descending_order(n) do
    {integer, _} =
      Integer.digits(n)
      |> Enum.sort(:desc)
      |> Enum.join("")
      |> Integer.parse()

    integer
  end
end

defmodule Kata do
  @moduledoc """
  You are given an array (which will have a length of at least 3, but could be very large) containing integers. The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N. Write a method that takes the array as an argument and returns this "outlier" N.

  Examples
  [2, 4, 0, 100, 4, 11, 2602, 36]
  Should return: 11 (the only odd number)

  [160, 3, 1719, 19, 11, 13, -21]
  Should return: 160 (the only even number)
  """
  def find_outlier(integers) do
    require Integer

    numbers_assessment =
      integers
      |> Enum.map(fn number -> %{"number" => number, "is_even" => Integer.is_even(number)} end)

    frequencies =
      numbers_assessment
      |> Enum.frequencies_by(fn %{"is_even" => even} -> even end)

    if frequencies.true == 1 do
      [result] =
        numbers_assessment
        |> Enum.filter(fn %{"is_even" => even} -> even == true end)

      result["number"]
    else
      [result] =
        numbers_assessment
        |> Enum.filter(fn %{"is_even" => even} -> even == false end)

      result["number"]
    end
  end
end

defmodule SplitStrings do
  @moduledoc """
  Complete the solution so that it splits the string into pairs of two characters. If the string contains an odd number of characters then it should replace the missing second character of the final pair with an underscore ('_').

  Examples:

  solution("abc") # should return ["ab", "c_"]
  solution("abcdef") # should return ["ab", "cd", "ef"]
  """
  require Integer

  def solution(str) do
    codepoints = str |> String.codepoints()
    codepoints_length = codepoints |> length

    is_odd? = codepoints |> length |> Integer.is_odd()

    if is_odd? do
      codepoints
      |> List.insert_at(codepoints_length, "_")
      |> Enum.chunk_every(2)
      |> Enum.map(fn pair -> List.to_string(pair) end)
    else
      codepoints |> Enum.chunk_every(2) |> Enum.map(fn pair -> List.to_string(pair) end)
    end
  end
end

defmodule Solution do
  @moduledoc """
  Write an algorithm that will identify valid IPv4 addresses in dot-decimal format. IPs should be considered valid if they consist of four octets, with values between 0 and 255, inclusive.

  Valid inputs examples:
  Examples of valid inputs:
  1.2.3.4
  123.45.67.89
  Invalid input examples:
  1.2.3
  1.2.3.4.5
  123.456.78.90
  123.045.067.089
  Notes:
  Leading zeros (e.g. 01.02.03.04) are considered invalid
  Inputs are guaranteed to be a single string
  """
  def is_valid_ip(ip) do
    frequencies = String.graphemes(ip) |> Enum.frequencies()

    if frequencies["."] == 3 do
      charlist = ip |> to_charlist()

      with {:ok, _} <- :inet.parse_address(charlist) do
        true
      else
        {:error, _} -> false
      end
    else
      false
    end
  end
end
