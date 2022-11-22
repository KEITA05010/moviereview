class User::MoviesController < ApplicationController
before_action :authenticate_user!, only: [:show, :create]
    
def index
 @movies=Movie.new_title
end

def old
 @movies=Movie.old_title
end

def show
  @movie=Movie.find(params[:id])#現在の映画のid
  @comment=Comment.new
  @comments=Comment.where(movie_id: @movie.id)#現在の映画のidのコメントを表している
   # @favorite=Favorite.new
end

def search
  @movies = Movie.search(params[:keyword])
  @keyword = params[:keyword]
  render "index"
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
