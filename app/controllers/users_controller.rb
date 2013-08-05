class UsersController < ApplicationController
	
	def login
		@page = "Login"
	end

	def home
		@logged_in_user = "Yedidya"
		@page = "Home"

	end

	def profile
		@page = "Profile"
		Song.create(genre: "New", title: "New", artist: "New")
  end 

end