class DashboardController < ApplicationController

  def index
    render :json =>  {:greeting => 'Hello'}
  end

end