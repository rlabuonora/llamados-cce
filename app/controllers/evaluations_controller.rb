class EvaluationsController < ApplicationController
    
    
    def new
      @propuesta = Proposal.find(params[:proposal_id])
      @evaluation = Evaluation.new(proposal: @propuesta) # override to generate associated response
      @response = EmprendedoresCapacitacionesResponse.new()
      @evaluation.evaluatable = @response
    end
    
    def create
      @propuesta = Proposal.find(params[:proposal_id])
      @evaluation = Evaluation.new(proposal: @propuesta, user: current_user)
      # Repite create
      evaluation_params = params.require(:evaluation).permit(:propuesta, :antecedentes, :conocimiento)
      @evaluation.evaluatable = EmprendedoresCapacitacionesResponse.new(evaluation_params)
      
      if @evaluation.save & @evaluation.evaluatable.save
          redirect_to @propuesta.call, notice: "Evaluación Guardada"
      else 
          render :new
      end
      

    end
end
