class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

 def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  def search
    case params[:duration]
    when "1"
      runtime_in_minutes = "AND runtime_in_minutes < 90"
    when "2"
      runtime_in_minutes = "AND runtime_in_minutes >= 90 AND runtime_in_minutes <= 120"
    when "3"
      runtime_in_minutes = "AND runtime_in_minutes > 120"
    end

    @movies = Movie.where("title like ? AND director like? #{runtime_in_minutes}", "%#{params[:title]}%", "%#{params[:director]}%")  
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description, :image
    )
  end

end