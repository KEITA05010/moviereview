class Admin::MoviesController < ApplicationController

def new
  @movie=Movie.new
end

def index
  @movies=Movie.all
end 

def show
  @movie=Movie.find(params[:id])
end

def edit
  @movie=Movie.find(params[:id])
end

def create
@movie=Movie.new(movie_params)

if @movie.save

redirect_to admin_movie_path(@movie)
else
 @movies=Movie.all
  render :index
end 

end 

def update
@movie = Movie.find(params[:id])
if @movie.update(movie_params)
 flash[:notice]="You have updated book successfully."
redirect_to admin_movies_path
else
render :index
end

end


private
# ストロングパラメータ
def movie_params
params.require(:movie).permit(:title, :introduction, :genre_id, :image, :release_date )
end

 
end