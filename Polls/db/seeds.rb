# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  users = User.create([
    { user_name: "kyungmin" },
    { user_name: "aaron" }
  ])

  polls = Poll.create([
    { title: "Fake Poll", author_id: 1 },
    { title: "AA Satisfaction Survey", author_id: 2 }
  ])

  questions = Question.create([
    { text: "How are you today?", poll_id: 2 },
    { text: "How much do you feel you are learning?", poll_id: 2 },
    { text: "This is a fake question?", poll_id: 1 }
  ])

  answers = AnswerChoice.create([
    { question_id: 1, choice: 1 },
    { question_id: 1, choice: 2 },
    { question_id: 1, choice: 3 },
    { question_id: 1, choice: 4 },
    { question_id: 1, choice: 5 },
    { question_id: 2, choice: 1 },
    { question_id: 2, choice: 2 },
    { question_id: 2, choice: 3 },
    { question_id: 2, choice: 4 },
    { question_id: 2, choice: 5 },
    { question_id: 3, choice: 1 },
    { question_id: 3, choice: 2 }
  ])

  responses = Response.create([
    { question_id: 1, user_id: 1, answer_id: 1 },
    { question_id: 3, user_id: 2, answer_id: 12 }
  ])
end