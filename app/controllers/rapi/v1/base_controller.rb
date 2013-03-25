class Rapi::V1::BaseController < ActionController::Base
   before_filter :authenticate_user
   #before_filter :check_rate_limit
   respond_to :json, :xml


   private
	def authenticate_user
	  @current_user = User.find_by_authentication_token(params[:token])
	  unless @current_user
		respond_with({:error => "Token is invalid"}, :status => 403)
	  end
    	  
	end

	def current_user
	  @current_user
	end

	def check_rate_limit
	  if @current_user.request_count > 500
		error = { :error => "Too many requests" }
		respond_with(error, :status => 403)
	  else	
	 	 @current_user.increment!(:request_count)
	  end
	end
end
