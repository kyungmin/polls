class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :question_id, :null => false
      t.integer :user_id, :null => false
      t.integer :answer_id
      t.timestamps
    end
  end
end
