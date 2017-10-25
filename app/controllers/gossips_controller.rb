class GossipsController < ApplicationController

	def index
		@gossips = Gossip.all
	end

	def new
	@gossip = Gossip.new		
	end

	def create
	@gossip = Gossip.new
	@gossip.anonymous_author = params[:anonymous_author]
	@gossip.content = params[:content]
	@gossip.save
	redirect_to @gossip
	end

	def show
		@gossip = Gossip.find(params[:id])

	end

end
