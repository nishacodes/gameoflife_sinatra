module Pattern
  def random(number)
    number.times do |i|
      y = rand(@height)
      x = rand(@width)
      grid[y][x].tap {|cell| cell.state = cell.alive}
    end
  end

  def create_blinker(y,x) # starting point coordinates
    blinker = [grid[y][x],grid[y][x-1],grid[y][x+1]]
    blinker.each {|object| object.state = object.alive} 
  end

  def create_toad(y,x) # starting point coordinates
    toad = [grid[y][x],
            grid[y][x+1],
            grid[y][x+2],
            grid[y-1][x+1],
            grid[y-1][x+2],
            grid[y-1][x+3]]
    toad.each {|object| object.state = object.alive}
  end

  def create_pulsar(y,x)
    pulsar = [grid[y-1][x-2], grid[y-1][x+2],
              grid[y-1][x-3], grid[y-1][x+3],
              grid[y-1][x-4], grid[y-1][x+4],
              grid[y-6][x-2], grid[y-6][x+2],
              grid[y-6][x-3], grid[y-6][x+3],
              grid[y-6][x-4], grid[y-6][x+4],
              grid[y+1][x-2], grid[y+1][x+2],
              grid[y+1][x-3], grid[y+1][x+3],
              grid[y+1][x-4], grid[y+1][x+4],
              grid[y+6][x-2], grid[y+6][x+2], 
              grid[y+6][x-3], grid[y+6][x+3],
              grid[y+6][x-4], grid[y+6][x+4],
              grid[y-2][x-1], grid[y-2][x+1],
              grid[y-3][x-1], grid[y-3][x+1],
              grid[y-4][x-1], grid[y-4][x+1],
              grid[y+2][x-1], grid[y+2][x+1],
              grid[y+3][x-1], grid[y+3][x+1],
              grid[y+4][x-1], grid[y+4][x+1],
              grid[y-2][x-6], grid[y-2][x+6],
              grid[y-3][x-6], grid[y-3][x+6],
              grid[y-4][x-6], grid[y-4][x+6],
              grid[y+2][x-6], grid[y+2][x+6],
              grid[y+3][x-6], grid[y+3][x+6],
              grid[y+4][x-6], grid[y+4][x+6]
            ]
    pulsar.each {|object| object.state = object.alive}
  end

end