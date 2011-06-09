require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  test "should validate question_id" do
    assert Answer.create(:question_id => nil).errors[:question_id].any?
  end

  test "should validate body" do
    assert Answer.create(:body => "").errors[:body].any?
  end

  test "should create" do
    assert questions(:unanswered).answers.create(:body => "ipsum").errors.empty?
  end
end
