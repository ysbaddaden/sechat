module Sechat
  class AnswersController < ApplicationController
    before_filter :load_question

    def index
      @answers = @question.answers.all
      respond_with(@question, @answers)
    end

    def show
      @answer = @question.answers.find(params[:id])
      respond_with(@question, @answer)
    end

    def new
      @answer = @question.answers.build
      respond_with(@question, @answer)
    end

    def edit
      @answer = @question.answers.find(params[:id])
    end

    def create
      @answer = @question.answers.build(params[:answer])
      @answer.save
      
      respond_with(@question, @answer) do |format|
        format.html do
          if @answer.persisted?
            redirect_to question_path(@question, :anchor => "A#{@answer.to_param}")
          else
            render 'new'
          end
        end
      end
    end

    def update
      @answer = @question.answers.find(params[:id])
      @answer.update_attributes(params[:answer])
      
      respond_with(@question, @answer,
        :location => question_path(@question, :anchor => "A#{@answer.to_param}"))
    end

    def answer
      @answer = @question.answers.find(params[:id])
      @answer.toggle!(:answer)
      
      respond_with(@question, @answer,
        :location => question_path(@question, :anchor => "A#{@answer.to_param}"))
    end

    def destroy
      @answer = @question.answers.find(params[:id])
      @answer.destroy
      respond_with(@question, @answer)
    end

    def load_question
      @question = Question.find(params[:question_id])
    end
  end
end
