class AdmissionsController < ApplicationController
  def index
    @admissions = Admission.all
  end

  def create
  end

  def new
    @admission = Admission.new
  end

  def show
    @admission = Admission.find params[:id]
  end
end
