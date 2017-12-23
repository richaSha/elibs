class BooksController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    @books = Book.all
    @titles = Title.all
  end

  def show
    @book = Book.find(params[:id])
    @title = Title.find(@book.title_id)
    @order_item = current_order.order_items.new
    @review = @book.reviews.new
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book created!"
      redirect_to '/'
    else
      flash[:alert] = @book.errors.full_messages
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book updated!"
      redirect_to '/'
    else
      flash[:alert] = @book.errors.full_messages
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book deleted."
    redirect_to '/'
  end

private
  def book_params
    params.require(:book).permit(:name, :recently_added, :cover, :page_count, :title_id )
  end
end
