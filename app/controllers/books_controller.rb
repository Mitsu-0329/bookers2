class BooksController < ApplicationController
  def new
  end

  # 以下を追加
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    

    @book.user_id = current_user.id
    # 3. データをデータベースに保存するためのsaveメソッド実行
    @book.save
    # 4. トップ画面へリダイレクト
    redirect_to book_path(@book.id)
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @user = current_user
    @books = Book.all
    @book = Book.new
    @book_show = Book.find(params[:id])
  end

  def edit
  end

  private
 # ストロングパラメータ
 def book_params
  params.require(:book).permit(:title, :body)
end


end
