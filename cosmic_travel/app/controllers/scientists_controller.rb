class ScientistsController < ApplicationController

    def index
        @scientists = Scientist.all
    end

    def show
        @scientist = Scientist.find(params[:id])
    end

    def new
        @scientist = Scientist.new
    end

    def create
        @scientist = Scientist.new(scientist_params)
        if @scientist.valid?
            @scientist.save
            redirect_to scientist_path(@scientist)
        else
            byebug
            render :new
        end
    end

    private

    def scientist_params
        params.require(:scientist).permit(:name, :field_of_study)
    end

end
