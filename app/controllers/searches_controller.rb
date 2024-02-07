class SearchesController < ApplicationController
  before_action :authenticate_user!


  def search
    @model = params[:model]
    # ユーザーが選択した検索対象のモデル（user または book）を @model変数 に代入している

    @content = params[:content]
    # ユーザーが入力した検索キーワードを @content変数 に代入している

    @method = params[:method]
    # ユーザーが選択した検索方法（perfect/ forward/ backward/ partial）を @method変数 に代入している

# 選択したモデルに応じて検索を実行⬇️

    if @model == "user"
    # 選択されたモデルが user である場合の条件分岐 / ユーザーの検索を行います

      @records = User.search_for(@content, @method)
      # 選択された検索対象（ユーザー（user））に対して、 search_forメソッド を呼び出して検索を実行し、結果を @records変数 に代入する

    else
      # 上記の条件に当てはまらない場合の条件分岐 / book の検索を行います

      @records = Books.search_for(@content, @method)
      # 選択された検索対象（書籍（book））に対して、 search_forメソッド を呼び出して検索を実行し、結果を @records変数 に代入する

    end
  end
end
