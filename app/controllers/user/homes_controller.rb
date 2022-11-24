class User::HomesController < ApplicationController
    
    def top
      @movies = Movie.new_title
    end
    
    def success
    
    end
    
    def favoritetest
      
    end
end