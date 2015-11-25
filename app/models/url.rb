class Url < ActiveRecord::Base

	before_create :shorten

	# validates :original_url, presence: true
	validates :original_url, format: { with: URI.regexp }, if: Proc.new { |a| a.original_url.present? }

	#validates :original_url, presence: true
	# validates :original_url, format: { with: /((?:https?\:\/\/|www\.)(?:[-a-z0-9]+\.)*[-a-z0-9]+.*)/i, message: "Error: URL not valid" }

	# url = Url.new
	# url.valid? # => false"
	# url.errors.messages

	def self.validate_input(input)
    row = Url.new(original_url: input)
    row.valid?
    p "[ERROR MESSAGES ON VALIDATION]"
    p row.errors.messages
    row.errors.messages
   end

	def shorten
		self.shortened_url = SecureRandom.hex(6)
	end
end
