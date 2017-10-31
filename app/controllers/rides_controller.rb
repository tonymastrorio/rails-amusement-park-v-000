class RidesController < ApplicationController

    def create
        r = Ride.create(:user_id => session[:user_id], :attraction_id => params[:attraction_id])
        @message = r.take_ride

        redirect_to user_path(r.user, :message => @message)
    end
end
