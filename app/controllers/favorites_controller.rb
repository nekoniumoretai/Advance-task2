class FavoritesController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @favorite = current_user.favorites.new(book_id: @book.id)
    # favorite = その時ログインしているユーザーの
    if @favorite.save
    # いいねを保存
    # redirect_back(fallback_location: root_path)
      respond_to do |format|
        format.js
      end
    else
      #エラー処理
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy
    # redirect_back(fallback_location: root_path)
    respond_to do |format|
      format.js
    end
    
  end
end
