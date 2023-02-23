class User::HomesController < ApplicationController
    require 'ostruct'
    require 'themoviedb-api'
    Tmdb::Api.key("09b5ed8d8092e9f2a1b97326e8014633")
    Tmdb::Api.language("ja") # こちらで映画情報の表示の際の言語設定を日本語にできます
 
    def top
      @tmdb_movies =  JSON.parse(Tmdb::Discover.movie.to_json)
    end
    
    def about
        
    end
    
    def success
        
    end
    
    def favoritetest
      
    end
end