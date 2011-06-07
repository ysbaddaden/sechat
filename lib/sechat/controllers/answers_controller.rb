module Sechat
  class AnswersController < ApplicationController
    def index
      @answer = question.answers.all
      respond_with(@answers)
    end

    def show
      @answer = question.answers.find(params[:id])
      respond_with(@answer)
    end

    def new
      @answer = question.answers.build
      respond_with(@answer)
    end

    def edit
      @answer = question.answers.find(params[:id])
    end

    def create
      @answer = question.answers.build(params[:answer])
      @answer.save
      respond_with(@answer)
    end

    def update
      @answer = question.answers.find(params[:id])
      @answer.update_attributes(params[:answer])
      respond_with(@answer)
    end

    def destroy
      @answer = question.answers.find(params[:id])
      @answer.destroy
      respond_with(@answer)
    end

    def question
      @question ||= resource_class.find(params[:question_id])
    end

    def resource_class
      Question
    end
  end
end
