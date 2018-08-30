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

    def record_update(model, data)
      if model.update data
        render :action => :show
      else
        render :json => { errors: model.errors.full_messages }
      end
    end
end
