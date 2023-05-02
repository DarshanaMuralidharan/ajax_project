class ReviewController < ApplicationController
  include ActionView::Helpers::DateHelper

  before_action :set_movie
  before_action :set_review, only: [:edit_review, :update]

  def review_new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.movie_id = @movie.id
    @review.user_id = current_user.id
    if @review.save
      redirect_to movie_path(@movie)
    else
      flash[:error] = @review.errors.full_messages.join(", ")
      redirect_to movie_path(@movie)
    end
  end

  def edit_review
    @review = @movie.reviews.find(params[:id])
    end
  def update
    @review = @movie.reviews.find(params[:id])
    if @review.update(review_params)
      redirect_to @movie, notice: 'Review was successfully updated.'
    else
      render :edit_review
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:comments, :ratings)
  end
  def set_review
    @review = Review.find(params[:id])
  end
end
