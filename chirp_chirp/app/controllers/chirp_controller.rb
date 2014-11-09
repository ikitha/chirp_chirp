class ChirpController < ApplicationController
	WillPaginate.per_page = 10
	
	def index
		@chirps = Chirp.paginate(:page => params[:page])

		render 'index'
	end

	def create
		@num = Random.new.rand(1..4)
		Chirp.create(
			chirp: params[:chirp],
			pic: @num.to_i
		)
		redirect_to "/"
	end

	def show
		@chirp = Chirp.find(params[:id])

		render 'edit'
	end

	def update
		chirp = Chirp.find(params[:id])

		if params[:delete_button]
			chirp.destroy
		else
			chirp.update(
				chirp: params[:chirp]
			)
		end
		redirect_to "/"
	end
end