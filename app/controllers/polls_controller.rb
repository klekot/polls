class PollsController < ApplicationController
  before_action :questions_init

  def index
  end

  def poll
  end

  def rules
  end

  def question
    @correct = ""
    unless params[:selected_answer_id].nil?
      unless Answer.find(params[:selected_answer_id]).correct
        @correct = "NO!"
      else
        @correct = "YES!"
      end
    end
    @question = Question.find(@counter) if @counter <= @questions_quantity
    if params[:selected_answer_id]
      @resume = Resume.create(user: current_user, question: Question.find(params[:question_id]), answer: Answer.find(params[:selected_answer_id]))
    end
  end

  def resume
    @wrong = []
    @resumes.each do |resume|
      unless Answer.find(resume.answer_id).correct
        @wrong.push Question.find(resume.question_id).question
      end
    end
  end

  private

  def questions_init
    @counter = 1
    @counter += params[:question_counter].to_i if params[:question_counter]
    @questions_quantity = Question.all.size
    @resumes = Resume.for_user current_user
  end
end
