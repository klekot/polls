class Question < ApplicationRecord
  has_many :answers
  has_many :resumes
end
