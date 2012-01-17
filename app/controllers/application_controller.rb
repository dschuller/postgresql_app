class ApplicationController < ActionController::Base
  
	protect_from_forgery
	helper_method :current_player

  private
  
  def current_player
  	  @current_player ||= Player.find(session[:player_id]) if session[:player_id]
  end
  
  def authenticate_user!
  		if current_player.nil?
  			redirect_to login_url, :alert => "Anmeldung erforderlich!"
  	  end
  end

  def StatusToColor(s)
  	  case s
  	  when "1" # spielt
			  "#33cc00"
		  when "2" # Ersatz
			  "#777700"
		  else # "3" = kann nicht
		  	  "#990000"
  	  end
  end
  
  def ColorToStatus(c)
  	  case c
  	  	when "#33cc00" # spielt
  	  		1	  
  	  	when "#777700" # Ersatz
  	  		2
		else # #990000 = kann nicht
			3
		end
  end
  
  def StatusToStartHour(st)
  	  case st
		  when "1" # spielt
			  h = 10
		  when "2" # Ersatz
			  h = 11
		  else # kann nicht
			  h = 12
  	  end
  end

  def selection_to_status(selection)
  	  case selection
		  when "1"
			  "playing"
		  when "2"
			  "substitute"
		  else "absent"
  	  end
  end
  
  def DatepickerToHash(p)
  	  dp = p[:picker]
  	  dd_mm_yy = dp.split('.')
  	  y = dd_mm_yy[2].to_i
  	  m = dd_mm_yy[1].to_i
  	  d = dd_mm_yy[0].to_i
	  h = StatusToStartHour(p[:status])  	  
  	    	  
  	  dt = Date.new(y,m,d)
  	  wd = dt.wday
  	  st = DateTime.new(y,m,d,h,0)
  	  et = DateTime.new(y,m,d,13,0)
  	  
  	  h = {:date => dt, :wday => wd, :start => st, :end => et}
  end

  def event_form_data_to_params(p)
  	  # Modifies the event form params:
  	  # :start_at -  string 'dd.mm.yyyy' => DateTime
  	  # :color - prepend '#'
  	  dd_mm_yy = p[:start_at].split('.')
  	  start_at = DateTime.new(dd_mm_yy[2].to_i, dd_mm_yy[1].to_i, dd_mm_yy[0].to_i)
  	  event_params = {:name => p[:name], :color => p[:color], :start_at => start_at, :end_at => start_at}
	end
end
