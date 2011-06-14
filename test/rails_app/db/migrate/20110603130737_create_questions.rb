class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string   :subject,       :null => false
      t.text     :body,          :null => false
      t.boolean  :answered,                      :default => false
      t.integer  :replies_count,                 :default => 0
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :questions
  end
end
