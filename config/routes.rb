Rails.application.routes.draw do
  # Questionsリソースに対する7つの標準的なRESTfulルートを生成
  # GET /questions - 質問一覧を表示(index)
  # GET /questions/new - 新規質問作成フォーム(new)
  # POST /questions - 質問を作成(create)
  # GET /questions/:id - 特定の質問を表示(show)
  # GET /questions/:id/edit - 質問編集フォーム(edit)
  # PATCH/PUT /questions/:id - 質問を更新(update)
  # DELETE /questions/:id - 質問を削除(destroy)
  resources :questions do
    # 質問にネストされた回答のための7つの標準的なRESTfulルートを生成
    # GET /questions/:question_id/answers - 特定質問の回答一覧(index)
    # GET /questions/:question_id/answers/new - 新規回答作成フォーム(new)
    # POST /questions/:question_id/answers - 回答を作成(create)
    # GET /questions/:question_id/answers/:id - 特定の回答を表示(show)
    # GET /questions/:question_id/answers/:id/edit - 回答編集フォーム(edit)
    # PATCH/PUT /questions/:question_id/answers/:id - 回答を更新(update)
    # DELETE /questions/:question_id/answers/:id - 回答を削除(destroy)
    resources :answers
  end
end
