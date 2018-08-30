class SearchController < ApplicationController
  def staff
    results = Staff.where(
        "first_name LIKE :search OR last_name LIKE :search", 
        { :search => "%#{params[:search]}%" }
      )
    render :json => results
  end
end
