class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  private
    def record_save(model)
      if model.save
        render :json => { errors: [], new_id: model.id }
      else
        render :json => { errors: model.errors.full_messages }
      end
    end
end
