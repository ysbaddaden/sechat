require 'test_helper'

class RepliesControllerTest < ActionController::TestCase
  setup do
    @question = questions(:replied)
    @reply = replies(:replied_1)
  end

  test "should get index as xml" do
    get :index, :question_id => @question.to_param, :format => 'xml'
    assert_response :ok
    assert_select "replies reply", @question.replies.count
  end

  test "should get show as xml" do
    get :show, :question_id => @question.to_param, :id => @reply.to_param, :format => 'xml'
    assert_response :ok
    assert_select 'reply', 1
  end

  test "should get new" do
    get :new, :question_id => @question.to_param
    assert_response :ok
    assert_select "form[action=#{question_replies_path(@question)}]"
  end

  test "should get new as xml" do
    get :new, :question_id => @question.to_param, :format => 'xml'
    assert_response :ok
    assert_select "reply", 1
  end

  test "should get edit" do
    get :edit, :question_id => @question.to_param, :id => @reply.to_param
    assert_response :ok
    assert_select "form[action=#{question_reply_path(@question, @reply)}] input[value=put]"
  end

  test "should create" do
    assert_difference('@question.replies.count') do
      post :create, :question_id => @question.to_param, :reply => { :body => "lorem ipsum" }
      assert_redirected_to question_url(@question, :anchor => "A#{assigns(:reply).to_param}")
    end
  end

  test "should create as xml" do
    assert_difference('@question.replies.count') do
      post :create, :question_id => @question.to_param,
        :reply => { :body => "lorem ipsum" }, :format => 'xml'
      assert_response :created
      assert_equal question_reply_url(@question, assigns(:reply)), response.headers['Location']
    end
  end

  test "should update" do
    put :update, :question_id => @question.to_param,
      :reply => { :body => "dolor sit amet" }, :id => @reply.to_param
    assert_redirected_to question_url(@question, :anchor => "A#{@reply.to_param}")
    assert_equal "dolor sit amet", @reply.reload.body
  end

  test "should update as xml" do
    put :update, :question_id => @question.to_param, :id => @reply.to_param,
      :reply => { :body => "dolor sit amet" }, :format => 'xml'
    assert_response :ok
    assert_nil response.headers['Location']
  end

  test "should set answer" do
    assert_difference('Question.answered.count') do
      assert_difference('Reply.where(:answer => true).count') do
        put :answer, :question_id => @question.to_param, :id => @reply.to_param
        assert_redirected_to question_url(@question, :anchor => "A#{@reply.to_param}")
      end
    end
  end

  test "should set answer as xml" do
    assert_difference('Question.answered.count') do
      assert_difference('Reply.where(:answer => true).count') do
        put :answer, :question_id => @question.to_param, :id => @reply.to_param, :format => 'xml'
        assert_response :ok
        assert_nil response.headers['Location']
      end
    end
  end

  test "should unset answer" do
    assert_difference('Question.answered.count', -1) do
      assert_difference('Reply.where(:answer => true).count', -1) do
        put :answer, :question_id => questions(:answered).to_param, :id => replies(:answer).to_param
        assert_redirected_to question_url(questions(:answered), :anchor => "A#{replies(:answer).to_param}")
      end
    end
  end

  test "should unset answer should not affect multi-answered question" do
    assert_no_difference('Question.answered.count') do
      assert_difference('Reply.where(:answer => true).count', -1) do
        put :answer, :question_id => questions(:multi_answered).to_param,
          :id => replies(:multi_answered_1).to_param
        assert_redirected_to question_url(questions(:multi_answered), :anchor => "A#{replies(:multi_answered_1).to_param}")
      end
    end
  end

  test "should unset answer as xml" do
    assert_difference('Question.answered.count', -1) do
      assert_difference('Reply.where(:answer => true).count', -1) do
        put :answer, :question_id => questions(:answered), :id => replies(:answer).to_param, :format => 'xml'
        assert_response :ok
        assert_nil response.headers['Location']
      end
    end
  end

  test "should destroy" do
    assert_difference('@question.replies.count', -1) do
      delete :destroy, :question_id => @question.to_param, :id => @reply.to_param
      assert_redirected_to question_replies_url
    end
  end

  test "should destroy as xml" do
    delete :destroy, :question_id => @question.to_param, :id => @reply.to_param,
      :format => 'xml'
    assert_response :ok
    assert_nil response.headers['Location']
  end
end
