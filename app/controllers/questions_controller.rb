class QuestionsController < ApplicationController
  # 質問一覧表示
  def index
    # Questionモデルから全ての質問を取得
    @questions = Question.all
    # @questionsをビューに渡す
    # index.html.erbで@questionsを使用できるようになる
    # @questionsは配列として扱える
  end

  # 質問詳細表示
  def show
    # params[:id]で取得した質問のIDを元にDBから質問を取得
    @question = Question.find(params[:id])
  end

  # 質問作成
  def new
    @question = Question.new
  end

  # 質問登録
  def create
    # Questiionモデルのインスタンスを生成
    @question = Question.new(question_params)
    # QuestionモデルをDBに保存
    if @question.save
      # showにリダイレクト
      redirect_to @question
    else
      # 保存に失敗した場合はnewに戻る ステータスコードは422
      render "new", status: :unprocessable_entity
    end
  end

  # 質問編集
  def edit
    @question = Question.find(params[:id])
  end

  # 質問更新
  def update
    # params[:id]で取得した質問のIDを元にDBから質問を取得
    @question = Question.find(params[:id])
    # 質問の内容を更新
    if @question.update(question_params)
      # 更新に成功した場合はshowにリダイレクト
      redirect_to @question
    else
      # 更新に失敗した場合はeditに戻る ステータスコードは422
      render "edit", status: :unprocessable_entity
    end
  end

  # 質問削除
  def destroy
    # params[:id]で取得した質問のIDを元にDBから質問を取得
    @question = Question.find(params[:id])
    # 質問を削除
    @question.destroy
    # indexにリダイレクト
    redirect_to questions_path
  end

  # Strong Parameters
  private
  def question_params
    params.require(:question).permit(:title, :name, :content)
  end
end
