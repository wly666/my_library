class BooksController < ApplicationController
  layout 'two'
  def index
    @books = Book.all
    @books = Book.where("name like '%#{params[:query]}%'")
    #render layout: false//在主页中不要禁用layout
  end

  def destroy
    book = Book.find params[:id]
    book.delete
    redirect_to "/books"
  end

  def edit
    @book = Book.find params[:id]
    #render layout: "application"
  end

  def update
    @book = Book.find params[:id]
    @book.name= params[:book][:name]
    @book.author= params[:book][:author]
    @book.save
    redirect_to books_path
  end

  def new
    @book = Book.new
  end

  def create
    Book.create :name=>params[:book][:name], :author=>params[:book][:author]
    redirect_to books_path
  end
end
