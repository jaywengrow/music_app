class SongsController < ApplicationController

  def index
  	@logged_in_user = "Yedidya"
  	@page = "Song Index"
  	@songs = Song.all
  end

  def new
  	@page = "Upload Your Music"
  	@song = Song.new
  end

  def create
  	@song = Song.create(genre: params[:song][:genre], title: params[:song][:title], artist: params[:song][:artist])
		
		redirect_to @song, notice: 'Song was successfully created.'
  end

  def show
    @song = Song.find(params[:id])

    @page = @song.title

  end

  def edit
    @song = Song.find(params[:id])
    if @song.title
      @page = "Edit: " + @song.title
    else
      @page = "Edit"
    end
  end

  def update
    @song = Song.find(params[:id])
    x = @song
    x.update_attributes(genre: params[:song][:genre], title: params[:song][:title], artist: params[:song][:artist])
    
    render :text => "Song Updated!"
   


    #if @song.update_attributes(params[:song])
    #flash[:notice] = "Song updated!"
    #redirect_to songs_path
    #else
    #flash[:error] = "Something went wrong"
    #redirect_to songs_path
    #end  

  end
  
  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    render :text => "Song destroyed!! BWAHAHAHA!"
  end
  
end
