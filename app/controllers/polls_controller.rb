class PollsController < ApplicationController
  before_action :questions_init

  POLLING_TIME = 60
  PENALTY      = 10
  START_COUNT  = 1

  def index
  end

  def poll
  end

  def rules
  end

  def question
    @correct = true
    unless params[:selected_answer_id].nil?
      unless Answer.find(params[:selected_answer_id]).correct
        @correct = false
      else
        @correct = true
      end
    end
    @question = Question.find(@counter) if @counter <= @questions_quantity
    if params[:selected_answer_id]
      @resume = Resume.create(user: current_user, question: Question.find(params[:question_id]), answer: Answer.find(params[:selected_answer_id]))
    end
  end

  def resume
    last_penalty = false
    @wrong = []
    @polling_time = POLLING_TIME
    @penalty = PENALTY
    @remain = @@remain
    @resumes.each do |resume|
      unless Answer.find(resume.answer_id).correct
        @wrong.push Question.find(resume.question_id).question
        if resume.question_id == @questions_quantity
          last_penalty = true
        end
      end
    end
    # костыль, знаю ;)
    current_user.polling_time = last_penalty ?
        POLLING_TIME - @@remain.to_i - PENALTY * (@wrong.size - 1) :
        POLLING_TIME - @@remain.to_i - PENALTY * (@wrong.size )
    current_user.save
  end

  def countdown
    @@remain = params[:remain]
  end

  private

  def questions_init
    gon.seconds = POLLING_TIME
    gon.penalty = PENALTY
    @counter = START_COUNT
    @counter += params[:question_counter].to_i if params[:question_counter]
    @questions_quantity = Question.all.size
    @resumes = Resume.for_user current_user
  end
end
