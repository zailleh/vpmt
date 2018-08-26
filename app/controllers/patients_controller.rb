class PatientsController < ApplicationController
  # GET /patients
  def index
    @patients = Patient.all
  end
  
  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/:id
  def show
    @patient = Patient.find params[:id]
  end

  # POST /patients
  def create
    @patient = Patient.new patient_params
    @patient.date_of_birth = Date.new
    @patient.customer = Customer.first
    if @patient.save
      redirect_to patient_path @patient
    else
      render :new
    end
  end


  private
    def patient_params
      params.require(:patient).permit(:name, :breed, :date_of_birth, :customer_id, :animal_type)
    end

end
