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

	def edit
		@gossip = Gossip.find(params[:id])
	end

	def update
		@gossip = Gossip.find(params[:id])
		if @gossip.update(gossip_params)
				redirect_to @gossip
		else
			render 'edit'
		end
	end
private
  def gossip_params
    params.permit(:anonymous_author, :content)
  end

end
