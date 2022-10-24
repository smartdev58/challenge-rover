class RoverCalculator

  DIRECTIONS = ['N', 'E', 'S', 'W']
  TURN_COMMANDS = ['L', 'R']
  MOVE_COMMAND = 'M'

  @current_direction = 0
  @current_position_x = 0
  @current_position_y = 0

  def self.move(square, position_head, command)
    @current_position_x = square[:x].to_i
    @current_position_y = square[:y].to_i

    position_letters = position_head.split(' ')
    @current_position_x = position_letters[0].to_i
    @current_position_y = position_letters[1].to_i
    @current_direction = DIRECTIONS.find_index(position_letters[2])

    command.split('').each do |command_letter|
      case command_letter
      when TURN_COMMANDS[1]
        turn_right
      when TURN_COMMANDS[0]
        turn_left
      when MOVE_COMMAND
        move_one
      end
    end

    "#{@current_position_x} #{@current_position_y} #{DIRECTIONS[@current_direction]}"

  end

  private

  def self.move_one
    case DIRECTIONS[@current_direction]
    when DIRECTIONS[0]
      @current_position_y += 1
    when DIRECTIONS[1]
      @current_position_x += 1
    when DIRECTIONS[2]
      @current_position_y -= 1
    when DIRECTIONS[3]
      @current_position_x -= 1
    end
  end

  def self.turn_right
    @current_direction += 1
    @current_direction = 0 if @current_direction > 3
  end

  def self.turn_left
    @current_direction -= 1
    @current_direction = 3 if @current_direction < 0
  end
end