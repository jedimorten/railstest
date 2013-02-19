class Rapi::V1::SurveysController < Rapi::V1::BaseController
  before_filter :find_survey, :only => [:show, :update]
  def index
	respond_with(Survey.where("user_id = ?", current_user.id))
  end

  def create
	survey = current_user.surveys.build(params[:survey])
	if survey.valid?
	  respond_with(survey, :location => rapi_v1_surveys_path(survey))
	else	
	  respond_with(survey)
	end
  end

  def show
	respond_with(@survey, :methods => "dataCollection")
  end

  def update
	@survey.update_attributes(params[:survey])
	respond_with(@survey, :methods => "dataCollection")
  end
  
  private
	def find_survey
	  @survey = Survey.where(:user_id => current_user.id, :id => params[:id]).first
	 rescue ActiveRecord::RecordNotFound 
	    error = { :error => "Survey does not exist." }
  	    respond_with(error, :status => 404)	 
	end
end
