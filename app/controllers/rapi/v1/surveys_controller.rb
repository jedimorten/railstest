class Rapi::V1::SurveysController < Rapi::V1::BaseController
  before_filter :find_survey, :only => [:show, :update, :destroy]

  def index
	@surveys = Survey.where("user_id = ?", current_user.id)
	respond_with(@surveys)
  end

  def create
	params[:survey][:dataCollection] = params[:survey][:dataCollection].to_json
	params[:survey][:names1] = params[:survey][:names1].to_json
	params[:survey][:names2] = params[:survey][:names2].to_json
	params[:survey][:units] = params[:survey][:units].to_json
	params[:survey][:numberOfCategories] = params[:survey][:numberOfCategories].join(', ')
	survey = current_user.surveys.build(params[:survey])
	if survey.save
	  respond_with(survey, :location => rapi_v1_surveys_path(survey), :status => 201)  
	else	
	  respond_with(survey)
	end
  end

  def show
	respond_with(@survey)
  end

  def update
	params[:survey][:dataCollection] = params[:survey][:dataCollection].to_json
        params[:survey][:names1] = params[:survey][:names1].to_json
        params[:survey][:names2] = params[:survey][:names2].to_json
        params[:survey][:units] = params[:survey][:units].to_json
        params[:survey][:numberOfCategories] = params[:survey][:numberOfCategories].join(', ')
	
	@survey.update_attributes(params[:survey])
	respond_with(@survey)
  end

  def destroy
	@survey.destroy
	respond_with(@survey)
  end

  def options
	allow_cross_domain
	render :text => "", :layout => false
  end
  
  private
	def find_survey
	  @survey = Survey.where(:user_id => current_user.id, :id => params[:id]).first
	  if @survey == nil	 
	    error = { :error => "Survey does not exist." }
  	    respond_with(error, :status => 404)	 
	  end
	end
end
