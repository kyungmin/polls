class AddAnswerToAnswerChoices < ActiveRecord::Migration
  def self.up
    add_column :answer_choices, :choice, :string
    change_column :answer_choices, :choice, :string, :null => false
  end

  def self.down
    remove_column :answer_choices, :choice
  end
end
