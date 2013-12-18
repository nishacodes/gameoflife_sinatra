require "./board"
require "./cell"
require "./pattern"

# INSTRUCTIONS
# -------------
# OPTIONS TO PASS IN AS PARAMETERS: (width, height, # generations,pattern)
# for pattern, say "pattern" or "random"

board = Board.new(100,30,800,"pattern")
