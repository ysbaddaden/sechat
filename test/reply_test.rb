require 'test_helper'

class ReplyTest < ActiveSupport::TestCase
  test "should validate question_id" do
    assert Reply.create(:question_id => nil).errors[:question_id].any?
  end

  test "should validate body" do
    assert Reply.create(:body => "").errors[:body].any?
  end

  test "should create" do
    assert questions(:unreplied).replies.create(:body => "ipsum").errors.empty?
  end
end
