class CallsController < ApplicationController
    
    def index
      @calls = Call.all
    end
    
    def show
      @call = Call.find(params[:id])
    end
    
    def new
      @call = Call.new
    end
    
    def create
      call_params = params.require(:call).permit(:nombre, :centro)
      @call = Call.new(call_params)
      @call.save
      redirect_to @call
    end
    
    
end
