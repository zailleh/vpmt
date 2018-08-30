class AdmissionsController < ApplicationController
  def index
    @admissions = Admission.all
  end

  def filter
    #  admit_at       :datetime
#  discharge_at   :datetime
    filter = params[:filter]
    admit_at_field = Admission.arel_table[:admit_at]
    discharge_at_field = Admission.arel_table[:discharge_at]
    admit_type_field = AdmitType.arel_table[:type_name]
    
    now = Date.today

    admit_clause = admit_at_field.lteq(now.end_of_day)
    discharge_clause = discharge_at_field.gteq(now.beginning_of_day).or(discharge_at_field.eq(nil))

    admit_type_clause = admit_type_field.lower.eq(filter.downcase)

    if filter.downcase == 'schedule'
      @admissions = Admission.where(admit_clause.and(discharge_clause));
    else
      @admissions = Admission.joins(:admit_type).where(admit_clause.and(discharge_clause).and(admit_type_clause))
    end

    render :action => :index
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
