class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def filter
    filter = params[:filter]
    if filter.downcase == 'schedule'
      @appointments = Appointment.where(:when => Date.today.beginning_of_day..Date.today.end_of_day);
    else
      @appointments = Appointment.joins(:status).where( 'lower("appointment_statuses"."status") = ?', filter.downcase)
    end

    render :action => :index
  end

  def create
    appointment = Appointment.new appointment_params
    appointment.customer = Patient.find(appointment.patient_id).customer
    appointment.status = AppointmentStatus.find_by :status => 'Booked'
    record_save appointment
  end

  def new
    @appointment = Appointment.new

  end

  def show
    @appointment = Appointment.find params[:id]
  end

  def update
    @appointment = Appointment.find params[:id]

    record_update @appointment, appointment_params
  end

  private
    def appointment_params
      params.require(:appointment).permit(:when, :customer_id, :patient_id, :staff_id, :reason, :status_id)
    end
end
