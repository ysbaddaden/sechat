class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.references :question,   :null => false
      t.text       :body,       :null => false
      t.boolean    :answer,                     :default => false
      t.datetime   :created_at
    end
    
    add_index :answers, :question_id
  end

  def self.down
    drop_table :answers
  end
end
