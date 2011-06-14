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

  test "should get show for unreplied question" do
    get :show, :id => questions(:unreplied).to_param
    assert_response :ok
    assert_select 'h1', questions(:unreplied).subject
  end

  test "should get show for replied question" do
    get :show, :id => questions(:replied).to_param
    assert_response :ok
    assert_select 'h1', questions(:replied).subject
    assert_select '#replies article.reply', questions(:replied).replies.count
    
    questions(:replied).replies.each do |reply|
      assert_select "#A#{reply.to_param}", 1
      assert_select "a[href=#{answer_question_reply_path(questions(:replied), reply)}]", 1
    end
  end

  test "should get new" do
    get :new
    assert_response :ok
    assert_select "form[action=#{questions_path}]"
  end

  test "should get edit" do
    get :edit, :id => questions(:replied).to_param
    assert_response :ok
    assert_select "form[action=#{question_path(questions(:replied).to_param)}] input[value=put]"
  end

  test "should create" do
    assert_difference('Question.count') do
      post :create, :question => { :subject => "lorem ipsum", :body => "dolor sit amet" }
      assert_redirected_to question_url(assigns(:question))
    end
  end

  test "should update" do
    put :update, :question => { :subject => "dolor sit amet" }, :id => questions(:unreplied).to_param
    assert_redirected_to question_url(questions(:unreplied))
    assert_equal "dolor sit amet", questions(:unreplied).reload.subject
  end

  test "should destroy" do
    assert_difference('Question.count', -1) do
      assert_difference('Reply.count', -questions(:replied).replies.count) do
        delete :destroy, :id => questions(:replied).to_param
        assert_redirected_to questions_url
      end
    end
  end
end
