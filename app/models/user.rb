class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
	:token_authenticatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_many :surveys, :dependent => :delete_all 
  before_save :ensure_authentication_token
  
  def self.reset_request_count!
	update_all("request_count = 0", "request_count > 0")
  end


  def self.find_or_create_for_twitter(response)
    data = response['extra']['user_hash']

    user = User.find_by_twitter_id(data["id"])
    unless user
	user = User.new(:email => "#{data['id']}@twitter.com",
			:password => Devise.friendly_token[0,20])
	user.twitter_id = data["id"]
	user.twitter_screen_name = data['screen_name']
	user.twitter_display_name = data['display_name']
	user.confirm!
    end
    user
  end

  def self.find_or_create_for_facebook(response)
	user = User.find_by_facebook_id(response['uid'])
	Rails.logger.warn response 
	unless user
	  user = User.new(:email => "#{response['uid']}@facebook.com",
			  :password => Devise.friendly_token[0,20])
	  user.facebook_id = response['uid']
 	  user.facebook_name = response['extra']['raw_info']['name']
	  user.confirm!
	end
	user 
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
      data = access_token.info
      user = User.where(:email => data["email"]).first

      unless user
          user = User.create(:name => data["name"],
	    		   :email => data["email"],
	    		   :password => Devise.friendly_token[0,20]
	    		  )
      end
      user
  end
  
  def display_name
	if twitter_id
		"#{twitter_display_name} (@#{twitter_screen_name})"
	elsif facebook_id
		"#{facebook_name}"
	else
	 	email
	end
  end

  def to_s
	"#{display_name} (#{admin? ? "Admin" : "User"})"
  end 
end
