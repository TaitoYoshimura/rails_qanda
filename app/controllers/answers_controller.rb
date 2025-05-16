class AnswersController < ApplicationController

    #回答の登録
    def create
        @question = Question.find(params[:question_id])
        @question.answers.create(answer_params)
        redirect_to question_path(@question), notice: '回答が登録されました'
    end

    #回答の消去
    def destroy
        @question = Question.find(params[:question_id])
        @answer = @question.answers.find(params[:id])
        @answer.destroy
        redirect_to question_path(@question), status: :see_other, notice: '回答が削除されました'
    end

    private
    def answer_params
        params.require(:answer).permit(:name, :content)
    end
end
