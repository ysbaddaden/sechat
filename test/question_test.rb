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

  test "latest scope" do
    assert_equal [questions(:replied), questions(:multi_answered), questions(:unreplied), questions(:answered)],
      Question.latest
  end

  test "answered scope" do
    assert_equal [questions(:multi_answered), questions(:answered)],
      Question.answered.latest
  end

  test "unanswered scope" do
    assert_equal [questions(:replied), questions(:unreplied)],
      Question.unanswered.latest
  end
end
