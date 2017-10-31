class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
        @user = User.find_by(id: session[:user_id])
    end

    def show
        @attraction = Attraction.find_by(id: params[:id])
        @user = User.find_by(id: session[:user_id])
    end

    def new
        @attraction = Attraction.new
        @user = User.find_by(id: session[:user_id])
        if !@user.admin
            redirect_to user_path(@user)
        end
    end

    def create
        @attraction = Attraction.new(attraction_params)
        @attraction.save
        redirect_to attraction_path(@attraction)
    end

    def edit
        @user = User.find_by(id: session[:user_id])
        @attraction = Attraction.find_by(id: params[:id])
    end

    def update
        @attraction = Attraction.find_by(id: params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    private
    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :happiness_rating, :nausea_rating, :min_height)
    end

end
