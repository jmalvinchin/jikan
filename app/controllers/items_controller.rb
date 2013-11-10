class ItemsController < ApplicationController
	before_filter :authenticate_user!
	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)

		if @item.save
			redirect_to @item
		else
			render 'new'
		end
	end	

	def show
		@item = Item.find(params[:id])
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])

		if @item.update_attributes(params[:item].permit(:name,:price))
			redirect_to @item
		else
			render 'edit'
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to items_path
	end


	def index
		@items = Item.all
	end


	private
		def item_params
			params.require(:item).permit(:name,:price)
		end

end
