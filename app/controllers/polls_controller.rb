class PollsController < ApplicationController
  before_action :questions_quantity

  def index
  end

  def poll
  end

  def rules
  end

  def question
    @question = Question.first
    render partial: 'shared/question', locals: {counter: @counter} if @counter <= @questions_quantity
  end

  def next
    @question = Question.find(@counter) if @counter <= @questions_quantity
    redirect_to '/resume' if @counter > @questions_quantity
  end

  def resume
  end

  private

  def questions_quantity
    @counter = 1
    @counter += params[:question_counter].to_i if params[:question_counter]
    @questions_quantity = Question.all.size
  end
end
