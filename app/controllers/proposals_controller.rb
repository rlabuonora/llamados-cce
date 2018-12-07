class ProposalsController < ApplicationController
    
    
    def index
      @call = Call.find(params[:call_id])
      @props = @call.proposals
    end
    
    
    def new
      @call = Call.find(params[:call_id])
      @propuesta = @call.proposals.new
    end
    
    def create
      @call = Call.find(params[:call_id])
      prop_params = params.require(:proposal).permit(:proveedor)
      @propuesta = @call.proposals.new(prop_params)
      if @propuesta.save
          redirect_to call_proposals_path(@call),
                  notice: "Propuesta salvada"
          
      else
          render :new
      end
    end
end
