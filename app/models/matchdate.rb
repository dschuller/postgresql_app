# encoding: UTF-8
class Matchdate < ActiveRecord::Base
	validates :date, :uniqueness => true
	has_many :events	
end
