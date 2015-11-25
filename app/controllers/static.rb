get '/' do
	@urls = Url.all
  erb :"static/index"
end

post'/url' do
	p params[:user_input_long_url]
	url = Url.create(original_url: params[:user_input_long_url])

	redirect "/"
end

get "/:user_input_long_url" do
	url = Url.find_by(shortened_url: params[:user_input_long_url])

	unless url.nil?
		redirect url.original_url
	else
		redirect "/"
	end
end

# post '/urls' do

# Url.create(original_url: params[:original_url])
# url.shortened_url = url.shorten
# url.save

# redirect "/"
# end

# get '/:shortened_url' do
# 	erb :dashboard
# end