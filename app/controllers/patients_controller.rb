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
    
    # puts params[:patient][:img]
    # Cloudinary::Uploader.upload(params[:img])

    @patient.img_url = Cloudinary::Uploader.upload( params[:img])['url']

    # Cloudinary::Uploader.upload("dog.mp4", 
    #   :folder => "my_folder/my_sub_folder/", :public_id => "my_dog", :overwrite => true, 
    #   :notification_url => "https://requestb.in/12345abcd", :resource_type => "video")
    

    record_save @patient
  end


  private
    def patient_params
      puts params.inspect
      params.permit(:name, :breed, :date_of_birth, :customer_id, :animal_type)
    end

end
