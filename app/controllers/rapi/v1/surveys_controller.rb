class Rapi::V1::SurveysController < Rapi::V1::BaseController
  def index
	respond_with(Survey.where("user_id = ?", current_user.id))
  end
end
