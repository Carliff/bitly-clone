class Url < ActiveRecord::Base

	before_create :shorten
	# This is Sinatra! Remember to create a migration!
	# attr_reader :original_url, :shortened_url
	
	# validate :valid_email?

	# def valid_email?
	# 	if self.original_url.scan(/\w@\w{1}+[.]\w{2}/) == false
	# 		errors.add(:original_url, "Must be a URL")
	# 	end
	# end

	def shorten
		self.shortened_url = SecureRandom.hex(6)
	end

	# def validate_unique

	# end
end
