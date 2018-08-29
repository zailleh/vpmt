class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def create
    appointment = Appointment.new appointment_params
    appointment.customer = Patient.find(appointment.patient_id).customer
    appointment.appointment_status = AppointmentStatus.find_by :status => 'Booked'
    record_save appointment
  end

  def new
    @appointment = Appointment.new

  end

  def show
    @appointment = Appointment.find params[:id]
  end

  private
    def appointment_params
      params.require(:appointment).permit(:when, :customer_id, :patient_id, :staff_id, :reason)
    end
end
