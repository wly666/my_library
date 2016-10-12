class Interface::BooksController < ActionController::Base

  def all
    render :json => {
      :sex => 'male',
      :age => '18',
      name: '小王'
    }
  end

  def index
    books = Book.where("name like '%#{params[:query]}%'")
    books = Book.all
    #all_books=Book.all.map do |the_book|{
    #:name => the_book.name,
    #:author => the_book.author
    #}
    #end
    render :json =>{
      "success":"ok",
      #"result": all_books
      #"result":books
      :result=>books
    }
  end

  def destroy
    book = Book.find params[:id]
    book.delete
    render :json =>{
      :success =>"ok"
    }
  end

  def update
    book = Book.find params[:id]
    book.name= params[:name]
    book.author= params[:author]
    book.save
    render :json =>{
      :result =>'ok',
      :name =>book.name,
      :author =>book.author
    }
  end

  def create
    book= Book.create :name=> params[:name],:author=> params[:author]
    render :json => {
      :result => "ok",
      :name => book.name,
      :author =>book.author
    }
  end
end
