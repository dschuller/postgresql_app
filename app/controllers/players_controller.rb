class PlayersController < ApplicationController
  
	before_filter :authenticate_user!
	
	def new
  	  @player = Player.new({
  	  	:firstname => 'Max',
  	  	:lastname => 'Mustermann',
  	  	:email => 'max@mustermann.de',
  	  	:phone => '02305/123456',
  	  	:is_admin => true,
  	  	:is_guestplayer => false,
  	  	:mobile => '0171/12345678'})
  end

  def create
  	  @player = Player.new(params[:player])
  	  if @player.save
  	  	  redirect_to root_url, :notice => "Neuer Spieler #{@player.name} wurde angelegt!"
  	  else
  	  	  render "new"
  	  end
  end
  
  def index
  	  @players = Player.all	  
  end
  
  def destroy
  	@player = Player.find(params[:id])
    @player.destroy
    redirect_to root_url, :notice => "Der Spieler #{@player.name} wurde gel&ouml;scht!".safe_html
  end
  
  # GET /players/1/edit
  def edit
  	  @player = Player.find(params[:id])
  end
  
  # PUT /players/1
  # PUT /players/1.json
  def update
  	@player = Player.find(params[:id])

    respond_to do |format|
    	if @player.update_attributes(params[:player])
    	format.html { redirect_to players_path, notice: "#{@player.name} wurde bearbeitet!" }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end
end
