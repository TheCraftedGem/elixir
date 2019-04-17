defmodule RobotSimulator do

  def create() do

  end

  def create(direction \\ nil, position \\ nil)  do

    validated_directions = Enum.any?(valid_directions, fn x -> direction == x end)

    if is_tuple(position) && Enum.all?(Tuple.to_list(position), fn x -> is_integer(x) end) && Enum.count(Tuple.to_list(position)) == 2 && Enum.any?(Tuple.to_list(position), fn x -> is_integer(x) end) do
      if validated_directions  do
        %{direction: direction, position: position}
      else
        {:error, "invalid direction"}
      end
    else
      if  validated_directions  do
        {:error, "invalid position"}
      end
    end
  end

  def simulate(robot, instructions) do
    current_direction = robot.direction
    current_position = robot.position
    coords = String.to_charlist(instructions)

    if current_position == :north do
      Enum.map(coords, fn x -> if x == "L" do: Map.put(robot, :direction, :west) end)
      Enum.map(coords, fn x -> if x == "R" do: Map.put(robot, :direction, :east) end)
    else
      if current_position == :south do
        Enum.map(coords, fn x -> if x == "L" do: Map.put(robot, :direction, :east) end)
        Enum.map(coords, fn x -> if x == "R" do: Map.put(robot, :direction, :west) end)
      end
    else
      if current_position == :east do
        Enum.map(coords, fn x -> if x == "L" do: Map.put(robot, :direction, :north) end)
        Enum.map(coords, fn x -> if x == "R" do: Map.put(robot, :direction, :south) end)
      end
    else
      if current_position == :west do
        Enum.map(coords, fn x -> if x == "L" do: Map.put(robot, :direction, :south) end)
        Enum.map(coords, fn x -> if x == "R" do: Map.put(robot, :direction, :north) end)
      end
    end
  end


  def direction(nil) do
    :north
  end

  def direction(robot) do
    robot.direction
  end

  def position(nil) do
    {0, 0}
  end

  def position(robot) do
    robot.position
  end

  defp valid_directions do
    [:north, :south, :east, :west]
  end

  defp valid_positions do
    [0,1,2,3,4,5,6,7,8,9]
  end
end
