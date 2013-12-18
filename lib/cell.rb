
class Cell
  attr_accessor :state, :x, :y, :neighbors, :board


  def initialize
    @state = dead
    @neighbors = []
  end

  def dead
    return " "
  end

  def alive
    return "o"
  end

  # THESE METHODS CHECK FOR EDGE CELLS
  def left_edge?
    x == 0
  end

  def top_edge?
    y == 0
  end

  def right_edge?
    @x == (board.width - 1)
  end

  def bottom_edge?
    @y == (board.height - 1)
  end


  def get_neighbors
    @neighbors << board.grid[y][x-1] unless left_edge? # west
    @neighbors << board.grid[y][x+1] unless right_edge? # east
    @neighbors << board.grid[y-1][x-1] unless (top_edge? || left_edge?) # northwest
    @neighbors << board.grid[y-1][x] unless top_edge? # north
    @neighbors << board.grid[y-1][x+1] unless (top_edge? || right_edge?) # northeast
    @neighbors << board.grid[y+1][x-1] unless (bottom_edge? || left_edge?) # southwest
    @neighbors << board.grid[y+1][x] unless bottom_edge? # south
    @neighbors << board.grid[y+1][x+1] unless (bottom_edge? || right_edge?) # southeast
    @neighbors
  end

  def evaluate_neighbors
    get_neighbors
    
    neighbor_states = @neighbors.collect do |cell|
      cell.state
    end  

    case state
      when alive
        # 2 or 3 live neighbors
        if neighbor_states.count(alive) == 2 || neighbor_states.count(alive) == 3
          board.to_live << self 
        else
          # any other amount will be less than 2 or more than 3
          board.to_die << self 
        end      
      
      when dead
        if neighbor_states.count(alive) == 3 
          board.to_live << self 
        else
          board.to_die << self
        end
    end  
    neighbor_states = []
    @neighbors = []
  end
    
end