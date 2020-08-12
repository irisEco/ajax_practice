class BooksController<ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)

    redirect_to books_path
  end

  def index
    @book = Book.all.order("weight desc")
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)

    redirect_to books_path
  end

  def update_title
    @book = Book.find(params[:id])
    @book.update({title:params[:title]})

    render :json => {status: "ok"}
    end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end

  def show
    @book = Book.find(params[:id])
  end

  def search
    @book = Book
    @book = @book.where({title: params[:info]}) if params[:info].present?
    @book = @book.where({content: params[:info]}) if params[:info].present?

    @book = @book.all.order("weight desc")

    render "index"
  end

  def book_params
    params.require(:book).permit(:content, :title,:weight)
  end
end