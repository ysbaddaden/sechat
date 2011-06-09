require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test "should validate subject" do
    assert Question.create(:subject => "").errors[:subject].any?
  end

  test "should validate body" do
    assert Question.create(:body => "").errors[:body].any?
  end

  test "should create" do
    assert Question.create(:subject => "lorem", :body => "ipsum").errors.empty?
  end
end
