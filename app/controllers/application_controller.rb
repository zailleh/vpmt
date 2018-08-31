class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :verify_user
  private
    def record_save(model)
      if model.save
        render :json => { errors: [], new_id: model.id }
      else
        render :json => { errors: model.errors.full_messages }
      end
    end

    def record_update(model, data)
      if model.update data
        render :action => :show
      else
        render :json => { errors: model.errors.full_messages }
      end
    end

    def verify_user
      unless session[:user_id].nil?
        staff = Staff.find_by :id => session[:user_id]
        if (staff.nil?)
          render :json => { error: "not logged on" }
        end
      else
        render :json => { error: "not logged on" }
      end
    end
end
