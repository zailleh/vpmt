class SearchController < ApplicationController
  def staff
    first_name = Staff.arel_table[:first_name]
    last_name = Staff.arel_table[:last_name]
    search = '%' + params[:search].downcase + '%'

    query = first_name.matches(search).or(last_name.matches(search))

    results = Staff.where(query)

    render :json => results
  end
end
