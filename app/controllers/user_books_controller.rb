class UserBooksController < ApplicationController
  before_action :set_user_book, only: %i[ show edit update destroy ]

  # GET /user_books or /user_books.json
  def index
    @user_books = UserBook.all
  end

  # GET /user_books/1 or /user_books/1.json
  def show
    @user_book = UserBook.find(params[:id])
  end

  # GET /user_books/new
  def new
    @user_book = UserBook.new
  end

  # GET /user_books/1/edit
  def edit
    @user_book = UserBook.find(params[:id])
  end

  # POST /user_books or /user_books.json
  def create
    @user_book = UserBook.new(user_book_params)

    respond_to do |format|
      if @user_book.save
        format.html { redirect_to user_book_url(@user_book), notice: "User book was successfully created." }
        format.json { render :show, status: :created, location: @user_book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_books/1 or /user_books/1.json
  def update
    respond_to do |format|
      if @user_book.update(user_book_params)
        format.html { redirect_to user_book_url(@user_book), notice: "User book was successfully updated." }
        format.json { render :show, status: :ok, location: @user_book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_books/1 or /user_books/1.json
  def destroy
    @user_book.destroy

    respond_to do |format|
      format.html { redirect_to user_books_url, notice: "User book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_book
      @user_book = UserBook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_book_params
      params.require(:user_book).permit(:user_id, :book_id)
    end
end
