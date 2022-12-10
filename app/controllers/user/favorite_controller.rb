class User::FavoriteController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites= current_user.movies
  end
  
  def create
    favorite_movie = FavoriteMovie.where(movie_id: params[:movie_id])
    if favorite_movie.present?
      redirect_to favorite_index_path
      return
    end
    movie=Movie.find(params[:movie_id])
    favorite = FavoriteMovie.new()
    favorite.user = current_user
    favorite.movie = movie
    favorite.save

    redirect_to favorite_index_path
  end
 
end
