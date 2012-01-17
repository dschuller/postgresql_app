# encoding: UTF-8
class Player < ActiveRecord::Base
	
	validates :password, :firstname, :lastname, :email, :presence => {:on => :create}
	validates_uniqueness_of	:email
	
	has_secure_password
	has_many :events, :dependent => :destroy
	
	def name
		self.firstname + ' ' + self.lastname
	end
end
