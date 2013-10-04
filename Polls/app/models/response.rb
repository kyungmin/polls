class Response < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :question_id, :user_id, :answer_id
  validates :question_id, :presence => true
  validates :user_id, :presence => true
  validate :respondent_has_not_already_answered_question
  validate :author_cannot_respond_to_own_poll

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

  private

  def author_cannot_respond_to_own_poll
    author = User.joins(authored_polls: { questions: :answer_choices } )
                  .where('answer_choices.id = ?', answer_id)

    author_id = author[0].id

    if author_id == user_id
      errors[:base] << "Author cannot responde to own poll."
    end
  end

  def respondent_has_not_already_answered_question
    # skip validation if editing
    return true if existing_responses.include?(Response.where(user_id: user_id, question_id: question_id))

    unless existing_responses.empty?
      errors[:base] << "Respondent already has answered the question."
    end
  end

  def existing_responses
    answer_choice = AnswerChoice.find_by_sql([<<-SQL, answer_id])
      SELECT
        question_id
      FROM
        answer_choices
      WHERE
        id = ?;
    SQL
    q_id = answer_choice[0].question_id

    Response.where(user_id: user_id, question_id: q_id)
  end
end


#Response.create(:question_id => nil, user_id: user_id, answer_id: answer_id).valid?