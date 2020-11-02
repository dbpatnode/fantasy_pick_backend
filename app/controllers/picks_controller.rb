class PicksController < ApplicationController

    def index
        picks = Pick.all 
        render json: picks
    end

    def create 
        pick = Pick.create(pick_params)
        if pick.valid?
        render json: pick
        else render json:{error:"Failed to add new pick."}
        
    end

    def show 
        pick = Pick.find(params[:id])
        render json: pick
    end

    def update 
        pick = Pick.find(params[:id])
        pick.update(pick_params)
        render json: pick
    end

    def destroy 
        # byebug
        pick = Pick.find(params[:id])
        pick.destroy
        render json:{message: "pick has been deleted"}
    end
    
    private 

    def pick_params 
        params.require(:pick).permit(:user_id, :match_id, :winner)
    end
end
