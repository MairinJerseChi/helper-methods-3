class MoviesController < ApplicationController

  def force_user_sign_in
    if session[:user_id].present? 
      redirect_to "/users/sign_in"
    end 
  end 
  def new
    @new_movie = Movie.new
  end

  def index
    @movies = Movie.order(created_at: :desc)

    respond_to do |format|
      format.json { render json: @movies }
        #if statement that is checking whether it wants json or html 
      format.html
    end
  end

  def show
    @movie = Movie.find(params.fetch(:id))
  end


  def create
    @new_movie = Movie.new(movie_params)

    if @new_movie.valid?
      @new_movie.save

      redirect_to movies_url, notice: "Movie created successfully."
    else
      render "new"
    end
  end

  def edit
    @the_movie = Movie.find(params.fetch(:id))
  end

  def update
    @the_movie = Movie.find(params.fetch(:id))  
    if @the_movie.update(movie_params)
      redirect_to @the_movie, notice: "Movie updated successfully."
    else
      render "edit"
    end
  end

  def destroy
    @movie = Movie.find(params.fetch(:id))

    @movie.destroy

    redirect_to movies_url, notice: "Movie deleted successfully."
  end

  def movie_params 
    movie_params = params.require(:movie).permit(:title, :description, :image_url, :director_id)
    #defining a method that can be reused throughout 
  end 
end
