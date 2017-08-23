class QuestionsController < ApplicationController


  def index
    @questions = Question.all
  end
  def questions_by_a_user
    @user = current_user
    @questions = @user.questions
  end


  def show
   @question = question.find(params[:id])
  end

  def new
    @event = Event.find(params[:event_id])
    @question = Question.new
  end

  def create
    @event = Event.find(params[:event_id])
    @user = current_user
    @question = Question.new(question_params)
    @question.user = @user
    @question.event = @event
    if @question.save
      # redirect_to question_path(@question)
    else
      render :new
  end
end

  def edit
    @question = question.find(params[:id])
  end

  def update
    @question = question.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path(@question), notice: 'question was successfully updated.'
    else
      render :edit
  end
end

  def destroy
     @question = question.find(params[:id])
    @question.destroy
    redirect_to questions_path, notice: 'question was successfully deleted.'
  end

private

  def question_params
    params.require(:question).permit(:question, :title, :category, options_attributes: [:choice,:id, :destroy])
  end


end
