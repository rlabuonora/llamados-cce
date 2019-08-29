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
      prop_params = params.require(:proposal).permit(:proveedor, :adjunto)
      @propuesta = @call.proposals.new(prop_params)
      if @propuesta.save
          redirect_to call_proposals_path(@call),
                  notice: "Propuesta salvada"
          
      else
          render :new
      end
    end
    
    def destroy
      @call = Call.find(params[:call_id])
      @propuesta = Proposal.find(params[:id])
      if @propuesta.destroy
        @props = @call.proposals
          redirect_to call_proposals_path(@call),
                  notice: "Propuesta Eliminada"
      else
        render :index
      end
    end
end
