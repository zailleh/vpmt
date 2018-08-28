class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def create
    @customer = Customer.new customer_params

    if @customer.save
      render :json => { errors: [], new_id: @customer.id }
    else
      render :json => { errors: @customer.errors.full_messages }
    end
  end

  def new
    @customer = Customer.new
  end

  def show
    @customer = Customer.find params[:id]
  end

  private
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :street, :suburb, :post_code, :mobile, :phone, :email)
    end
end
