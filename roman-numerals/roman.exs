defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  # @spec numerals(pos_integer) :: String.t()

  @roman_numeral_map %{
    1    => "I",
    5    => "V",
    10   => "X",
    50   => "L",
    100  => "C",
    500  => "D",
    1000 => "M"
  }

  def numerals(number) do
    number_pool = split_integer(number)

    number_pool
      |> multiply_by_tenth_power()
      |> Enum.reject(fn int -> int == 0 end)
      |> Enum.map(&get_combined_numbers/1)
      |> List.flatten()
      |> Enum.map(&Map.get(@roman_numeral_map, &1, ""))
      |> Enum.join()
  end

  def split_integer(int) do
    int
    |> Kernel.to_string()
    |> String.split("", trim: true)
    |> Enum.map(fn integer_string ->
      Integer.parse(integer_string)
      |> case do
        {int, _} ->
          int
          _ -> 0
      end
    end)
  end

  def multiply_by_tenth_power(int_list) do
    int_list
    |> Enum.with_index(1)
    |> Enum.map(fn {int, index} ->
      ten_factor = :math.pow(10, length(int_list) - index)
      |> :erlang.floor()
        int * ten_factor
    end)
  end

  def get_combined_numbers(int, acc \\ {[], 0}) do
    is_negative? = int < 0
    abs_int = :erlang.abs(int)
    number_pool = Map.keys(@roman_numeral_map)
    {acc_list, last_index_inserted} = acc
    {difference, closest_int} = get_difference_and_closest_int(abs_int, number_pool)

    index_to_insert =
      if is_negative? do
        last_index_inserted - 1
      else
        last_index_inserted + 1
      end

      acc_list = List.insert_at(acc_list, index_to_insert, closest_int)

      if difference == 0 do
        acc_list
      else
        get_combined_numbers(difference, {acc_list, index_to_insert})
      end
  end

  def get_difference_and_closest_int(abs_int, number_pool) do
    number_pool_with_differences =
      number_pool
      |> Enum.map(fn int_to_compare ->
        {abs_int - int_to_compare, int_to_compare}
      end)

      {{difference, closest_int}, index} =
        number_pool_with_differences
        |> Enum.with_index()
        |> Enum.min_by(fn {{difference, _int_to_compare}, _index} ->
          :erlang.abs(difference)
        end)

        cond do
          difference == 0 ->
            {difference, closest_int}
          difference > 0 ->
            {difference, closest_int}
          difference < 0 ->
            abs_difference = :erlang.abs(difference)

            exact_match = Enum.find(number_pool, fn number -> number == abs_difference end)

            if not is_nil(exact_match) do
              {difference, closest_int}
            else
              Enum.at(number_pool_with_differences, index - 1)
            end
        end
  end
end
