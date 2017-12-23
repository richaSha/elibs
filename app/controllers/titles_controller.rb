class TitlesController < ApplicationController

  def show
    @titles = Title.all
    @title = Title.find(params[:id])
    @bookTitle = @title.title
    @books = @title.books
  end


end
