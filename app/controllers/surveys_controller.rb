class SurveysController < ApplicationController
  before_filter :find_survey, :only => [:show, :edit, :update, :destroy]

  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
    	flash[:notice] = "Survey is updated."
    	redirect_to @survey
    else 
	flash[:notice] = "Survey has not been updated."
        render :action => "edit"
    end
  end

  def create
    @survey = current_user.surveys.build(params[:survey])
    if @survey.save
    	flash[:notice] = "Survey has been created."
    	redirect_to @survey
    else
	flash[:alert] = "Survey has not been created."
	render :action => "new"
    end
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    flash[:notice] = "Survey is deleted"
    redirect_to surveys_path
  end

  private
	def find_survey
	  @survey = Survey.find(params[:id])
 	  rescue ActiveRecord::RecordNotFound
	  flash[:alert] = "Survey you looked was not found"
	  redirect_to surveys_path
	end
end
