class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
	@user = User.find_or_create_for_twitter(env["omniauth.auth"])
	flash[:notice] = "Signed in with Twitter"
	sign_in_and_redirect @user, :event => :authentication
  end

  def facebook
	@user = User.find_or_create_for_facebook(env["omniauth.auth"])
	flash[:notice] = "Signed in with Facebook"
	sign_in_and_redirect @user, :event => :authentication
  end

  def google_oauth2

    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)
	   
    if @user.persisted?
         flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
         sign_in_and_redirect @user, :event => :authentication
    else
         session["devise.google_data"] = request.env["omniauth.auth"]
         redirect_to new_user_registration_url
     end
  end  
       
      
     
 

end
