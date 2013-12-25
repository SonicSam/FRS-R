FrsR::App.controllers :sessions do

	get ':provider/callback' do
		auth = env['omniauth.auth']
		user = User.find_or_create_omniauth(auth)
		session[:user_id] = user.id
		redirect_to '/#loggedin'
	end
	
	get '/logout' do
		session[:user_id] = nil
		redirect_to '/#logout'
	end
	
	get '/failure' do
		redirect_to '/#fail'
	end
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  

end
