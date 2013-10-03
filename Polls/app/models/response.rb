class Response < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :question_id, :user_id, :answer_id
  validates :question_id, :presence => true
  validates :user_id, :presence => true

  belongs_to(
    :answer_choice,
    :class_name => 'AnswerChoice',
    :foreign_key => :answer_id,
    :primary_key => :id
  )

  belongs_to(
    :respondent,
    :class_name => 'User',
    :foreign_key => :user_id,
    :primary_key => :id
  )

end
