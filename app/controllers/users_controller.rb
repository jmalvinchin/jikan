class UsersController < ApplicationController
	def new
	end

	def create
		render text: params[:user].inspect
	end

end
