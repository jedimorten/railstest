class CdataController < ApplicationController
before_filter :authenticate_user!, :except => [:index, :show]
before_filter :find_survey
before_filter :find_cdatum, :only => [:show, :edit, :update, :destroy]

  def index

  end

  def new
    @cdatum = @survey.cdata.build
  end

  def show

  end

  def create
   @cdatum = @survey.cdata.build(params[:cdatum])
    if @cdatum.save
	flash[:notice] = "Data has been created."
	redirect_to [@survey, @cdatum]
    else
	flash[:alert] = "Data has not been created."
	render :action => "new"
    end
  end

  def edit

  end

  def update
    if @cdatum.update_attributes(params[:cdatum])
      flash[:notice] = "Data has been updated."
      redirect_to [@survey, @cdatum]
    else
      flash[:alert] = "Data has not been updated."
      render :action => "edit"
    end
  end

  def destroy
	@cdatum.destroy
	flash[:notice] = "Data has been deleted."
	redirect_to @survey
  end

  private
    def find_survey
	@survey = Survey.find(params[:survey_id])
    end
    
    def find_cdatum
        @cdatum = @survey.cdata.find(params[:id])
    end
end
