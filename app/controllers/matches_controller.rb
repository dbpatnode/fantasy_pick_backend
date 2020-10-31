class MatchesController < ApplicationController
    def index
        matches = Match.all
        render json: matches
      end
    
      def show
        match = Match.find_by(params[:id])
        render json: match
      end
end

