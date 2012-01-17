class EventsController < ApplicationController
	
	before_filter :authenticate_user!
	
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  	@event = Event.find(params[:id])
  	@status = ColorToStatus(@event.color)
  	render 'edit'
  end

  # GET /events/new
  # GET /events/new.json
  def new
  	@players = Player.all
  	@next_sunday = (Date.today + (7 - Date.today.wday)).strftime("%d.%m.%Y")
  	
  	respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @player = Player.find(@event.player_id)
    @matchdate = Matchdate.find(@event.matchdate_id)
  end

  # POST /events
  # POST /events.json
  def create
  	  dh = DatepickerToHash(params)
  	  md = Matchdate.find_by_date(dh[:date])
  	  p = Player.find(params[:player_id])
  	  c = StatusToColor(params[:status])  	  
  	  
  	  if dh[:wday] != 0
  	  	  flash[:error] = "Der " + params[:picker] + " ist kein Sonntag!"
  	  	  redirect_to :action => 'new'
  	  else
  	  	  e = Event.where('(name = ?) AND (matchdate_id = ?)', p.name, md.id).first
  	  	  unless e.nil?
  	  	  	  flash[:error] = "Es existiert schon ein Eintrag fuer #{p.name} am " + params[:picker] + "!"
  	  	  	  redirect_to :action => 'new'		  
  	  	  else
  	  	  	  event_params = {	:name => p.name,
  	  	  	  					:color => c,
  	  	  	  					:start_at => dh[:start],
  	  	  	  					:end_at => dh[:end],
  	  	  	  					:player_id => p.id,
  	  	  	  					:matchdate_id => md.id }	
  	  	  	  @event = Event.new(event_params)
			
			  respond_to do |format|
				  if @event.save
					  format.html { redirect_to :action => 'new', notice: "Gespeichert: #{p.name}" }
					  format.json { render json: @event, status: :created, location: @event }
				  else
					  format.html { render action: "new" }
					  format.json { render json: @event.errors, status: :unprocessable_entity }
				  end
			  end
		  end
	  end
  end
  
  def status_update
  	  event = Event.find(params[:id])
  	  if params[:commit]=="Speichern"
  	  	  color = StatusToColor(params[:status])
  	  	  h = StatusToStartHour(params[:status])
  	  	  start_at = event.start_at
  	  	  new_start_at = DateTime.new(start_at.year, start_at.month, start_at.day, h, 0, 0)
  	  	  
  	  	  event.update_attributes(:color => color, :start_at => new_start_at)
  	  else
  	  	  event.destroy
  	  end
  	  	  redirect_to root_path
  end
  
  # PUT /events/1
  # PUT /events/1.json
  def update
    
  	@event = Event.find(params[:event_id])
  	@event.color = StatusToColor(params[:status])

    respond_to do |format|
      # event_form_data_to_params() is defined in application_controller.rb
      if true # @event.update_attributes(event_form_data_to_params(params[:event]))
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :ok }
    end
  end
end
