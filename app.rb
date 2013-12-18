require 'bundler'
Bundler.require
require './lib/board.rb'
require './lib/cell.rb'
require './lib/pattern.rb'

  
module GameOfLife
  class App < Sinatra::Application
    
    # board = Board.new(100,30,800,"pattern")
   
    get '/' do
      erb :index
    end

    helpers do 
      def simple_partial(template)
        erb template
      end
    end

  end
end

# TO DO
