class CreateReplies < ActiveRecord::Migration
  def self.up
    create_table :replies do |t|
      t.references :question,   :null => false
      t.text       :body,       :null => false
      t.boolean    :answer,                     :default => false
      t.datetime   :created_at
    end
    
    add_index :replies, :question_id
  end

  def self.down
    drop_table :replies
  end
end
