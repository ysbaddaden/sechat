require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :ok
    assert_select "a[href=#{new_question_path}]"
    assert_select "#questions article.question", Question.count
  end

  test "should get show" do
    get :show, :id => questions(:first).to_param
    assert_response :ok
    assert_select 'h1', questions(:first).subject
  end

  test "should get new" do
    get :new
    assert_response :ok
    assert_select "form[action=#{questions_path}]"
  end
end
