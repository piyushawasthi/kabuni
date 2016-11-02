class VisitsController < ApplicationController
  def create
    @link = Link.find_by(:shorten => params[:shorten])

    if @link
      Visit.create(:link_id => @link.id, :ip_address => request.remote_ip, :city => request.location.city, :state => request.location.state, :country => request.location.country_code)
      redirect_to "http://#{@link.target_url}"
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
