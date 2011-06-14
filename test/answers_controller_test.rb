require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  setup do
    @question = questions(:answered)
    @answer = answers(:answered_1)
  end

  test "should get index as xml" do
    get :index, :question_id => @question.to_param, :format => 'xml'
    assert_response :ok
    assert_select "answers answer", @question.answers.count
  end

  test "should get show as xml" do
    get :show, :question_id => @question.to_param, :id => @answer.to_param, :format => 'xml'
    assert_response :ok
    assert_select 'answer', 1
  end

  test "should get new" do
    get :new, :question_id => @question.to_param
    assert_response :ok
    assert_select "form[action=#{question_answers_path(@question)}]"
  end

  test "should get new as xml" do
    get :new, :question_id => @question.to_param, :format => 'xml'
    assert_response :ok
    assert_select "answer", 1
  end

  test "should get edit" do
    get :edit, :question_id => @question.to_param, :id => @answer.to_param
    assert_response :ok
    assert_select "form[action=#{question_answer_path(@question, @answer)}] input[value=put]"
  end

  test "should create" do
    assert_difference('@question.answers.count') do
      post :create, :question_id => @question.to_param, :answer => { :body => "lorem ipsum" }
      assert_redirected_to question_url(@question, :anchor => "A#{assigns(:answer).to_param}")
    end
  end

  test "should create as xml" do
    assert_difference('@question.answers.count') do
      post :create, :question_id => @question.to_param,
        :answer => { :body => "lorem ipsum" }, :format => 'xml'
      assert_response :created
      assert_equal question_answer_url(@question, assigns(:answer)), response.headers['Location']
    end
  end

  test "should update" do
    put :update, :question_id => @question.to_param,
      :answer => { :body => "dolor sit amet" }, :id => @answer.to_param
    assert_redirected_to question_url(@question, :anchor => "A#{@answer.to_param}")
    assert_equal "dolor sit amet", @answer.reload.body
  end

  test "should update as xml" do
    put :update, :question_id => @question.to_param, :id => @answer.to_param,
      :answer => { :body => "dolor sit amet" }, :format => 'xml'
    assert_response :ok
    assert_nil response.headers['Location']
  end

  test "should set answer" do
    assert_difference('Answer.where(:answer => true).count') do
      put :answer, :question_id => @question.to_param, :id => @answer.to_param
      assert_redirected_to question_url(@question, :anchor => "A#{@answer.to_param}")
    end
  end

  test "should set answer as xml" do
    assert_difference('Answer.where(:answer => true).count') do
      put :answer, :question_id => @question.to_param, :id => @answer.to_param, :format => 'xml'
      assert_response :ok
      assert_nil response.headers['Location']
    end
  end

  test "should unset answer" do
    assert_difference('Answer.where(:answer => true).count', -1) do
      put :answer, :question_id => @question.to_param, :id => answers(:answer).to_param
      assert_redirected_to question_url(@question, :anchor => "A#{answers(:answer).to_param}")
    end
  end

  test "should unset answer as xml" do
    assert_difference('Answer.where(:answer => true).count', -1) do
      put :answer, :question_id => @question.to_param, :id => answers(:answer).to_param, :format => 'xml'
      assert_response :ok
      assert_nil response.headers['Location']
    end
  end

  test "should destroy" do
    assert_difference('@question.answers.count', -1) do
      delete :destroy, :question_id => @question.to_param, :id => @answer.to_param
      assert_redirected_to question_answers_url
    end
  end

  test "should destroy as xml" do
    delete :destroy, :question_id => @question.to_param, :id => @answer.to_param,
      :format => 'xml'
    assert_response :ok
    assert_nil response.headers['Location']
  end
end
