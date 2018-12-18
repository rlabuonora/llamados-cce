class EvaluationsController < ApplicationController
    
    
    def new
      @propuesta = Proposal.find(params[:proposal_id])
      @evaluation = Evaluation.new(proposal: @propuesta) # override to generate associated response
      # TODO: move into model
      if @propuesta.call.publico == "Emprendedores" && @propuesta.call.modalidad == "Capacitación"
        @response = EmprendedoresCapacitacionesResponse.new()
      elsif @propuesta.call.publico == "Empresas" && @propuesta.call.modalidad == "Capacitación"
        @response = EmpresasCapacitacionesResponse.new()
      end
      @evaluation.evaluatable = @response
    end
    
    def create
      @propuesta = Proposal.find(params[:proposal_id])
      @evaluation = Evaluation.new(proposal: @propuesta, user: current_user)
      # Repite create
      if @propuesta.call.publico == "Emprendedores" && @propuesta.call.modalidad == "Capacitación"
        evaluation_params = params.require(:evaluation).permit(:propuesta, :antecedentes, :conocimiento)
        @evaluation.evaluatable = EmprendedoresCapacitacionesResponse.new(evaluation_params)
      elsif @propuesta.call.publico == "Empresas" && @propuesta.call.modalidad == "Capacitación"
        evaluation_params = params.require(:evaluation).permit(:formacion_titulo, :estudios, :formacion_equipo)
        @evaluation.evaluatable = EmpresasCapacitacionesResponse.new(evaluation_params)
      end
      
      if @evaluation.save & @evaluation.evaluatable.save
          redirect_to @propuesta.call, notice: "Evaluación Guardada"
      else 
          render :new
      end
      

    end
end
