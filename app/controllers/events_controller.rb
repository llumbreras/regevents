class EventsController < ApplicationController

	def index
		@events = ["Goal Setting", "Time Management", "Continuous Learning"]
	end
end
