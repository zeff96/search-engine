class SearchesController < ApplicationController
  def index
    query = params.fetch(:q, "*").presence || "*"
    @searches = UserQuery.search(query)
  end

  def create
    @search_query = UserQuery.new(search_query_params)
    @search_query.ip_address = request.remote_ip

    if @search_query.save
      redirect_to searches_path
    else
      # Handle validation errors
    end
  end

  def autocomplete
    render json: UserQuery.search(params[:term], field: { query: :text_start }).map(&:title)
  end

  private

  def search_query_params
    params.require(:search_query).permit(:query)
  end
end
