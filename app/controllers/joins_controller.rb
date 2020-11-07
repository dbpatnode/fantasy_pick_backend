class JoinsController < ApplicationController
    
    def index
        @joins = Join.all 
        render json: @joins
    end

    def create 
        @join = Join.create(join_params)
        if @join.valid?
        render json: @join
        else render json:{error:"Failed to join to league."}
    end
    end

    def show 
        @join = Join.find(params[:id])
        render json: @join
    end

    def update 
        @join = Join.find(params[:id])
        @join.update(join_params)
        render json: @join
    end

    def destroy 
        # byebug
        @join = Join.find(params[:id])
        @join.destroy
        render json:{message: "Removed from league"}
    end
    
    private 

    def join_params 
        params.require(:join).permit( :user_id, :league_id)
    end

end
