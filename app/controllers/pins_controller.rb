class PinsController < ApplicationController
	before_action :find_pin, only: [:show, :edit, :update, :destroy]

	def new
		@pin = Pin.new  		

	end
	def update
		
 
	    if @pin.update(pin_params)
	      redirect_to @pin
	    else
	      render 'edit'
	    end
	end
	

	def edit
	
	end

	def create
		@pin = Pin.create(pin_params)

		if @pin.save
			flash[:success] = 'Successfully created new pin'
			redirect_to @pin	

		else
			render 'new'
		end

	end

	def destroy
    	@pin.destroy
    	redirect_to root_path
   	end

	def show
		
	end

	def index
		@pins = Pin.all.order(:created_at).reverse
	end

	private

	# Use strong_parameters for attribute whitelisting
	# Be sure to update your create() and update() controller methods.

	def pin_params
	  params.require(:pin).permit(:title, :description)
	end

	def find_pin
	  @pin = Pin.find(params[:id])
	end

end
