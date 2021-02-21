class ArtistsController < ApplicationController
    def show 
        @artist = Artist.find(params[:id])
    end 

    def new 
        @artist = Artist.new 
    end 

    def create
        @artist = Artist.create(name: params[:artist][:name], bio: params[:artist][:bio])
        redirect_to artist_path(@artist)
        # @artist = Artist.find(params[:id])
        # byebug
        # @arist.create(name: params) 
    end 
    def edit 
        @artist = Artist.find(params[:id])
    end 
    def update 
        
        @artist = Artist.find(params[:id])
        @artist.update(artist_params(:name, :bio))
        redirect_to artist_path(@artist)
    end 

    private 
    def artist_params(*args)
        params.require(:artist).permit(*args)
    end 
end
