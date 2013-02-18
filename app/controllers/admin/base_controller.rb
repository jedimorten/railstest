class Admin::BaseController < ApplicationController
	before_filter :autorize_admin!
end
