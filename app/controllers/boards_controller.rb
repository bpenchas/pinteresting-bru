class BoardsController < ApplicationController
	before_action :find_board, only: [:show, :edit, :update, :destroy]

	def new
		@board = current_user.boards.build  		

	end
	def update
		
 		
	    if @board.update(board_params)
	      redirect_to @board
	    else
	      render 'edit'
	    end
	end
	

	def edit
	
	end

	def create
		@board = current_user.boards.build(board_params)

		if @board.save
			
			redirect_to @board, notice: 'Successfully created new board'

		else
			render 'new'
		end

	end

	def destroy
    	@board.destroy
    	redirect_to root_path
   	end

	def show
		
	end

	def index
	
		@boards = Board.all.order(:created_at).reverse
	end

	private

	# Use strong_parameters for attribute whitelisting
	# Be sure to update your create() and update() controller methods.

	def board_params
	  params.require(:board).permit(:name, :description)
	end

	def find_board
	  @board = Board.find(params[:id])
	end

end
