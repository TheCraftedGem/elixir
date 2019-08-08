defmodule Robot do
  defstruct direction: nil, position: nil
end

defmodule RobotSimulator do
  import Robot

  def create() do
    %{direction: :north, position: {0,0}}
  end

  def create(:invalid, _position)  do
    {:error, "invalid direction"}
  end

  def create(0, _position)  do
    {:error, "invalid direction"}
  end

  def create(direction, _position) when is_binary(direction)  do
    {:error, "invalid direction"}
  end

  def create(_direction , position) when is_tuple(position) == false do
    {:error, "invalid position"}
  end

  def create(_direction , position) when tuple_size(position) != 2  do
    {:error, "invalid position"}
  end

  def create(_direction , position) when elem(position, 0) |> is_integer() != true  do
    {:error, "invalid position"}
  end

  def create(_direction , position) when elem(position, 1) |> is_integer() != true  do
    {:error, "invalid position"}
  end

  def create(direction \\ nil, position \\ nil) when is_tuple(position) do
    %{direction: direction, position: position}
  end

  def simulate(robot, []) do
    robot
  end

  def simulate(robot, [head|tail]) when head == "A" do
    case robot.direction do
      :north -> simulate(Map.update!(robot, :position, fn {_a, b} -> {_a, b + 1} end), tail)
      :west  -> simulate(Map.update!(robot, :position, fn {a, _b} -> {a - 1, _b} end), tail)
      :east  -> simulate(Map.update!(robot, :position, fn {a, _b} -> {a + 1, _b} end), tail)
      :south -> simulate(Map.update!(robot, :position, fn {_a, b} -> {_a, b - 1} end), tail)
    end
  end

  def simulate(robot, [head|tail]) when head == "L" do
    case robot.direction do
      :north ->  simulate(Map.put(robot, :direction, :west), tail)
      :west  ->  simulate(Map.put(robot, :direction, :south), tail)
      :south ->  simulate(Map.put(robot, :direction, :east), tail)
      :east  ->  simulate(Map.put(robot, :direction, :north), tail)
    end
  end

  def simulate(robot, [head|tail]) when head == "R" do
    case robot.direction do
      :north ->  simulate(Map.put(robot, :direction, :east), tail)
      :west  ->  simulate(Map.put(robot, :direction, :north), tail)
      :south ->  simulate(Map.put(robot, :direction, :west), tail)
      :east  ->  simulate(Map.put(robot, :direction, :south), tail)
    end
  end

  def simulate(robot, [head|tail]) when head != "A" or "L" or "R" do
    {:error, "invalid instruction"}
  end

  def simulate(robot, instructions) when is_binary(instructions) do
    instructions = String.codepoints(instructions)
    simulate(robot, instructions)
  end

  def direction(robot) do
    robot.direction
  end

  def position(robot) do
    robot.position
  end
end


