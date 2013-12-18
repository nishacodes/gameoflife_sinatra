class Board
  attr_accessor :grid, :width, :height, :to_die, :to_live
  # include Pattern

	def initialize(width, height, generations, pattern="random")
    @width = width
    @height = height
    @grid = []
    @to_die = []
    @to_live = []
    @pattern = pattern
    create_empty_board
    assign_coordinates
    @pattern == "pattern" ? add_set_pattern : add_random_pattern
    # display
    generation(generations)
	end

  def create_empty_board
    height.times do |i|  # creates an array for each row
      grid << Array.new
    end
    grid.each do |array|
      width.times do |i|
        array[i] = Cell.new.tap {|cell| cell.board = self}
      end
    end
  end

  def assign_coordinates
    grid.each_with_index do |array, y_index|
      array.each_with_index do |cell, x_index|
        cell.y = y_index
        cell.x = x_index
      end
    end
  end

  def add_set_pattern
    create_toad(3,49)
    create_toad(26,49)
    create_toad(15,30)
    create_toad(15,70)
    create_blinker(5,30)
    create_blinker(5,70)
    create_blinker(25,30)
    create_blinker(25,70)
    create_pulsar(7,15)
    create_pulsar(7,85)
    create_pulsar(15,50)
    create_pulsar(22,15)
    create_pulsar(22,85)
  end

  def add_random_pattern
    number = (width * height / 3)
    random(number)
  end

  def generation(number)
    number.times do |i|
      evaluate_cells
      tick!
      clear_stage
      # display
      sleep(0.5)
    end
  end

  # def display
  #   iterate_cells {|cell| print "#{cell.state}"}
  #   puts
  # end


  def iterate_cells
    grid.each do |array|
      array.each do |cell|
        yield cell
      end
    end
  end

  def evaluate_cells
    iterate_cells {|cell| cell.evaluate_neighbors}
  end

  def tick!
    to_die.each do |cell|
      cell.state = cell.dead
    end

    to_live.each do |cell|
      cell.state = cell.alive
    end
  end

  def clear_stage
    to_die.clear
    to_live.clear
  end



end


