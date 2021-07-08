class Admins::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @newgenre = Genre.new
  end

  def create
    @newgenre = Genre.new(genre_params)
    if @newgenre.save
      redirect_to admins_genres_path
    else
      @genres = Genre.all
      render :index
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admins_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
