class PicksController < ApplicationController
    def index
        picks = Pick.all 
        render json: picks
    end

    def create 
        @match= Match.find_by(match_id: pick_params[:match_id])
        pick = Pick.create(user_id:pick_params[:user_id], match_id: @match.id, winner:pick_params[:winner], match_day:pick_params[:match_day])
        if pick.valid?
        render json: pick
        else render json:{error: pick.errors.full_messages}
    end
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
        pick = Pick.find(params[:id])
        pick.destroy
        render json:{message: "pick has been deleted"}
    end
    
    private 

    def pick_params 
        params.require(:pick).permit(:user_id, :match_id, :winner, :match_day)
    end

end
