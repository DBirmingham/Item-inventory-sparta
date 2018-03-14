class ItemsController < ApplicationController
	def index
		@item = Item.all
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		if(@item.save)
			redirect_to(items_path)
		end
	end

	def item_params
		params.require(:item).permit(:serial_num, :description, :supplier, :status, :lender)
	end

	def edit
		@item = Item.find(params[:id].to_i)
	end

	def update
		@item = Item.find(params[:id].to_i)
		@item.update(item_params)
		redirect_to(items_path)
	end

	def show
		@item = Item.find(params[:id].to_i)
	end

	def destroy
		@item = Item.find(params[:id].to_i)
		@item.destroy
		redirect_to(items_path)
	end
end
