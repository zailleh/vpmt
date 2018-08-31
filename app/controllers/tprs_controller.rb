class TprsController < ApplicationController
  def create
    tpr = Tpr.new tpr_params

    record_save tpr
  end

  private
    def tpr_params
      params.require(:tpr).permit(:staff_id, :resp_rate, :pulse, :temperature, :admission_id, :created_at)
    end
end
