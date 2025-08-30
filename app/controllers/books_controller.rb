class BooksController < ApplicationController
  def new
  end

  # 以下を追加
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    

    @book.user_id = current_user.id
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end





  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show

    @books = Book.all
    @book = Book.new
    @book_show = Book.find(params[:id])
    @user = @book_show.user
  end

  def edit
    # ここから追加
    @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
    # ここまで追加
  end

  def update
    # ここから追加
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
    # ここまで追加
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :edit
    end  
  end  

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト 
  end


  private
 # ストロングパラメータ
 def book_params
  params.require(:book).permit(:title, :body)
end


end
