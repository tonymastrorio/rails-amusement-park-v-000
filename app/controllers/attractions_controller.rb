class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
        current_user
    end

    def show
        @attraction = Attraction.find_by(id: params[:id])
        current_user
    end

    def new
        if current_user.admin
            @attraction = Attraction.new
        else
            redirect_to user_path(@user)
        end
    end

    def create
        @attraction = Attraction.new(attraction_params)
        @attraction.save
        redirect_to attraction_path(@attraction)
    end

    def edit
        if current_user.admin
            @attraction = Attraction.find_by(id: params[:id])
        end
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
