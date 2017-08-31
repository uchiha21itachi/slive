class AnswersController < ApplicationController

 def index
    @answers = Answer.all
  end

 def answers_by_question
    @user = current_user
    @answers = @questions.answers
  end


 def show
   @answer = answer.find(params[:id])
  end

 def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

 def create
    @question = Question.find(params[:question_id])
    @user = current_user
    @answer = Answer.new(answer_params)
    @answer.user = @user
    @answer.question = @question
    @event = @question.event
    if @answer.save
      redirect_to event_live_index_path(@event)
    else
      render :new
  end

 def edit
    @answer = answer.find(params[:id])
  end

 def update
    @answer = answer.find(params[:id])
    if @answer.update(answer_params)
      redirect_to event_question_path(@question)
    else
      render :edit
    end
  end



private

 def answer_params
    params.require(:answer).permit(:description)
  end

end
