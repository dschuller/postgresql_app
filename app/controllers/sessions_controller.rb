class SessionsController < ApplicationController
  def new
  end

  def create
	  player = Player.find_by_email(params[:email])
	  if player && player.authenticate(params[:password])
	  	  session[:player_id] = player.id
	  	  redirect_to root_url, :notice => "Eingeloggt!"
	  else
	  	  flash.now.alert = "Falsche Mailadresse oder Passwort"
		render "new"
	  end
  end

  def destroy
  	  session[:player_id] = nil
  	  redirect_to root_url, :notice => "Ausgeloggt!"
  end

end
