class StaffsController < ApplicationController
  skip_before_action :verify_user

  def login
    user = Staff.find_by(:email => params[:email])
    if !user.nil? && user.authenticate(params[:password])
      session[:user_id] = user.id.to_s
      render :json => { errors: [], user_id: user.id, user_name: user.first_name }
    else
      render :json => { errors: ["Username and Password could not be verified"]}
    end
  end

  def logout
    session[:user_id] = nil
  end
end
