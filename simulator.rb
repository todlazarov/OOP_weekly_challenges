class Simulator
  def place(name, args)
    name.at(args[:x], args[:y])
    name.orient(args[:direction])
  end

  def evaluate(name, str)
    instructions(str).each do |instruction|
      name.send(instruction)
    end
  end

  def instructions(str)
    results = []
    instruc = str.split('')

    instruc. each do |let|
      case let
      when 'L'
        results << :turn_left
      when 'R'
        results << :turn_right
      when 'A'
      results << :advance
      end
    end

    results
  end
end

class Robot < Simulator
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

  def coordinates
    @coordinates
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
    when :north
      @coordinates[1] += 1
    when :east
      @coordinates[0] += 1
    when :south 
      @coordinates[1] -= 1
    when :west
      @coordinates[0] -= 1
    end
  end
end
