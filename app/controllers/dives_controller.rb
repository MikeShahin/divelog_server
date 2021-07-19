class DivesController < ApplicationController
    def index
        dives = Dive.all
        render json: dives
    end

    def create
        @dive = Dive.new(dive_params)
    
        if @dive.save
          render json: @dive, status: :created, location: @dive
        else
          render json: @dive.errors, status: :unprocessable_entity
        end
      end

    private

    def dive_params
        params.require(:dive).permit(:buddy, :date, :time, :location, :temperature, :visibility, :dive_time, :depth, :comments, :picture, :user_id)
    end
end
