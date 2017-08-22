class QuestionsController < ApplicationController


  def index
    @questions = Question.all
  end

  def show
   @question = question.find(params[:id])
  end

  def new
    @question = question.new
  end

  def create
    @question = question.new(question_params)
    if @question.save
      redirect_to question_path(@question)
    else
      render :new
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

  def destroy
     @question = question.find(params[:id])
    @question.destroy
    redirect_to questions_path, notice: 'question was successfully deleted.'
  end

private

  def question_params
    params.require(:question).permit(:question, :title, :category, :user_id, :id)
  end


end
