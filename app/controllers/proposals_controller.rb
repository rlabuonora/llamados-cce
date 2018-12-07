class ProposalsController < ApplicationController
    
    
    def index
      @call = Call.find(params[:call_id])
      @props = @call.proposals
    end
end
