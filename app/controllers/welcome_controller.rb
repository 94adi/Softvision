class WelcomeController < ApplicationController
before_action :verify_user, :only => :new

def new

@user = current_user

end

private

def verify_user
  redirect_to '/login' unless current_user 
end

end