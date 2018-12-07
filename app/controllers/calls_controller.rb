class CallsController < ApplicationController
    
    def index
      @calls = Call.all
    end
    
    def show
      @call = Call.find(params[:id])
    end
    
    def edit
      @call = Call.find(params[:id])
    end
    
    def update
      @call = Call.find(params[:id])
      call_params = params[:call].permit(:nombre, :centro)
      if @call.update(call_params)
        redirect_to @call, notice: "Llamado Actualizado"
      else
        render :edit
      end
    end
    
    def new
      @call = Call.new
    end
    
    def create
      call_params = params.require(:call).permit(:nombre, :centro)
      @call = Call.new(call_params)
      if @call.save
        redirect_to @call, notice: "Llamado Creado"
      else
        render :new
      end
    end
    
    
end
