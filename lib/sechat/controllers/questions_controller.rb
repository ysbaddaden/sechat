module Sechat
  class QuestionsController < ApplicationController
    def index
      @questions = resource_class.latest
      respond_with(@questions)
    end

    def unanswered
      @questions = resource_class.unanswered.latest
      
      respond_with(@questions) do |format|
        format.html { render 'index' }
      end
    end

    def show
      @question = resource_class.find(params[:id])
      respond_with(@question)
    end

    def new
      @question = build_question
      respond_with(@question)
    end

    def edit
      @question = resource_class.find(params[:id])
    end

    def create
      @question = build_question(params[:question])
      @question.save
      respond_with(@question, :location => { :action => 'show', :id => @question.to_param })
    end

    def update
      @question = resource_class.find(params[:id])
      @question.update_attributes(params[:question])
      respond_with(@question, :location => { :action => 'show', :id => @question.to_param })
    end

    def destroy
      @question = resource_class.find(params[:id])
      @question.destroy
      respond_with(@question, :location => { :action => 'index' })
    end

    def resource_class
      Question
    end

    def build_question(params = nil)
      resource_class.new(params)
    end
  end
end
