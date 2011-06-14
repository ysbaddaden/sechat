module Sechat
  class RepliesController < ApplicationController
    before_filter :load_question

    def index
      @replies = @question.replies.all
      respond_with(@question, @replies)
    end

    def show
      @reply = @question.replies.find(params[:id])
      respond_with(@question, @reply)
    end

    def new
      @reply = @question.replies.build
      respond_with(@question, @reply)
    end

    def edit
      @reply = @question.replies.find(params[:id])
    end

    def create
      @reply = @question.replies.build(params[:reply])
      @reply.save
      
      respond_with(@question, @reply) do |format|
        format.html do
          if @reply.persisted?
            redirect_to question_path(@question, :anchor => "A#{@reply.to_param}")
          else
            render 'new'
          end
        end
      end
    end

    def update
      @reply = @question.replies.find(params[:id])
      @reply.update_attributes(params[:reply])
      
      respond_with(@question, @reply,
        :location => question_path(@question, :anchor => "A#{@reply.to_param}"))
    end

    def answer
      @reply = @question.replies.find(params[:id])
      @reply.toggle!(:answer)
      
      respond_with(@question, @reply,
        :location => question_path(@question, :anchor => "A#{@reply.to_param}"))
    end

    def destroy
      @reply = @question.replies.find(params[:id])
      @reply.destroy
      respond_with(@question, @reply)
    end

    def load_question
      @question = Question.find(params[:question_id])
    end
  end
end
