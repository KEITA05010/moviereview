class User::MoviesController < ApplicationController
 before_action :authenticate_user!, only: [:show, :create]
 require 'ostruct'
 require 'themoviedb-api'
 Tmdb::Api.key("09b5ed8d8092e9f2a1b97326e8014633")
 Tmdb::Api.language("ja") # こちらで映画情報の表示の際の言語設定を日本語にできます
 
    def index
        @tmdb_movies =  JSON.parse(Tmdb::Discover.movie.to_json)['table']['results']
        pp @tmdb_movies
    end
    
    def old
        @tmdb_movies =  JSON.parse(Tmdb::Movie.top_rated.to_json)['table']['results']
        pp @tmdb_movies
    end
    
    def action
        @tmdb_movies =  JSON.parse(Tmdb::Genre.movies(28).to_json)['table']['results']
    end
    
    def drama
        @tmdb_movies =  JSON.parse(Tmdb::Genre.movies(18).to_json)['table']['results']
    end
    
    def comedy
        @tmdb_movies =  JSON.parse(Tmdb::Genre.movies(35).to_json)['table']['results']
    end
    
    def romance
        @tmdb_movies =  JSON.parse(Tmdb::Genre.movies(10749).to_json)['table']['results']
    end
    
    def thriller
        @tmdb_movies =  JSON.parse(Tmdb::Genre.movies(53).to_json)['table']['results']
    end
    
    def horror
        @tmdb_movies =  JSON.parse(Tmdb::Genre.movies(27).to_json)['table']['results']
    end
    
    def sf
        @tmdb_movies =  JSON.parse(Tmdb::Genre.movies(878).to_json)['table']['results']
    end
    
    def anime
        @tmdb_movies =  JSON.parse(Tmdb::Genre.movies(16).to_json)['table']['results']
    end
    
    
    def result
        
    end
    
    
    def show
        if Movie.exists?(tmdb_id: params[:id]) 
            @movie=Movie.find_by(tmdb_id: params[:id])#現在の映画のid
        else
            @movie=Movie.create(tmdb_id: params[:id])#現在の映画のid
        end
        
        @movie_data=Tmdb::Movie.detail(params[:id])
        
        
        @comment=Comment.new
        @comments=Comment.where(movie_id:  @movie.id)#現在の映画のidのコメントを表している
        #else
        #redirect_to new
        #end
        # @favorite=Favorite.new
    end
    
    def search
        if params[:keyword] != ""
        @movies =  JSON.parse(Tmdb::Search.movie(params[:keyword]).to_json)['table']['results']
        @tmdb_movies = @movies.filter { |m| m['table']['title'].include?(params[:keyword]) }         
        @keyword = params[:keyword]
        end
        render "result"
        
    end
    
    def create
        @movie = Post.new(movie_params)
        @movie.user_id = current_user.id
        if @movie.save
            redirect_back(fallback_location: root_path)
        else
            redirect_back(fallback_location: root_path)
        end
    end
    
    private
    # ストロングパラメータ
    def movie_params
        params.require(:movie).permit(:title,:content )
    end


end
