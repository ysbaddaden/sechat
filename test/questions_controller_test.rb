require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :ok
    assert_select "a[href=#{new_question_path}]"
    assert_select "#questions article.question", Question.count
  end

  test "should get unanswered" do
    get :unanswered
    assert_response :ok
    assert_template 'questions/index'
    assert_select "#questions article.question", Question.unanswered.count
  end

  test "should get show for unanswered question" do
    get :show, :id => questions(:unanswered).to_param
    assert_response :ok
    assert_select 'h1', questions(:unanswered).subject
  end

  test "should get show for answered question" do
    get :show, :id => questions(:answered).to_param
    assert_response :ok
    assert_select 'h1', questions(:answered).subject
    assert_select '#answers article.answer', questions(:answered).answers.count
    questions(:answered).answers.each { |a| assert_select "#A#{a.to_param}", 1 }
  end

  test "should get new" do
    get :new
    assert_response :ok
    assert_select "form[action=#{questions_path}]"
  end

  test "should get edit" do
    get :edit, :id => questions(:answered).to_param
    assert_response :ok
    assert_select "form[action=#{question_path(questions(:answered).to_param)}] input[value=put]"
  end

  test "should create" do
    assert_difference('Question.count') do
      post :create, :question => { :subject => "lorem ipsum", :body => "dolor sit amet" }
      assert_redirected_to question_url(assigns(:question))
    end
  end

  test "should update" do
    put :update, :question => { :subject => "dolor sit amet" }, :id => questions(:unanswered).to_param
    assert_redirected_to question_url(questions(:unanswered))
    assert_equal "dolor sit amet", questions(:unanswered).reload.subject
  end

  test "should destroy" do
    assert_difference('Question.count', -1) do
      assert_difference('Answer.count', -questions(:answered).answers.count) do
        delete :destroy, :id => questions(:answered).to_param
        assert_redirected_to questions_url
      end
    end
  end
end
