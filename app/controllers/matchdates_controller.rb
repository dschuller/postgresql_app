class MatchdatesController < ApplicationController
	
	before_filter :authenticate_user!
	
  def create
  	  # Generate matchdays for the upcoming 12 months
  	  next_sunday  = Date.today +  (7 - Date.today.wday)
  	  while next_sunday < Date.today + 365
  	  	  # Create database entry
  	  	  md = Matchdate.new(:date => next_sunday, :note => '')
  	  	  md.save
  	  	  next_sunday = next_sunday + 7
  	  end
  end

  def index
  end

  def update
  end

  def edit
  end

end
