class SearchesController < ApplicationController
before_action :authenticate_user!

	def search
		@range = params[:range]
		@content = params[:word]
		@method = params[:search]
		if @range == '1'
          @records = User.search(@method,@content)
    else
    @records = Book.search(@method,@content)
		end
	end
end
