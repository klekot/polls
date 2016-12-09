class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :answer

  scope :for_user, -> (user) { Resume.where(user: user) }
end
