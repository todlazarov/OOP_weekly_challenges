class Simulator
  def place(name, position_data)
    name.at(position_data[:x], position_data[:y])
    name.orient(position_data[:direction])
  end

  def evaluate(name, str)
    instructions(str).each { |instruction| name.send(instruction) }
  end

  def instructions(str)
    str.chars.map do |let|
      case let
      when 'L' then :turn_left
      when 'R' then :turn_right
      when 'A' then :advance
      end
    end
  end
end

class Robot < Simulator
  attr_reader :coordinates

  ORIENTATIONS = [:west, :north, :east, :south]

  def initialize(x=0,y=0)
    @cooridnates = [x,y]
    @direction = nil
  end

  def orient(direction)
    raise ArgumentError.new("Invalid direction") unless ORIENTATIONS.include? direction
    @direction = direction
  end

  def bearing
    @direction
  end

  def at(x, y) 
    @coordinates = [x, y]
  end

  def turn_left
    idx = ORIENTATIONS.index(bearing)
    orient(ORIENTATIONS[idx - 1])
  end

  def turn_right
    idx = ORIENTATIONS.index(bearing)
    idx = -1 if idx == 3
    orient(ORIENTATIONS[idx + 1])
  end

  def advance
    case bearing
    when :north then @coordinates[1] += 1
    when :east then @coordinates[0] += 1
    when :south  then @coordinates[1] -= 1
    when :west then @coordinates[0] -= 1
    end
  end
end
