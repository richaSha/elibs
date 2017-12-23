class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:notice] = "Reviews added!"
      @book = Book.find(@review.book_id)
      redirect_to book_path(@book)
    else
      flash[:alert] = @review.errors.full_messages
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:review, :user_id, :book_id)
  end
end
