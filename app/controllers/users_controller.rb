class UsersController < ApplicationController
    
    get '/create_account' do
        erb :'users/create_account' #Create Account landing page.
        
    end

    post '/create_account' do
        # binding.pry #check that I have created a user
        # @user = User.create(username: params[:username], email: params[:email], password: params[:password])
        user = User.create(params)
        if user.valid? 
            session[:user_id] = user.id # session = user id
            redirect to "/users/#{user.id}"
        else 
            erb :'users/create_account'  # if fails start again
        end    

    end

    get '/users/:id' do # dynamic route with argument of the users_id
        # binding.pry 
        if User.find_by(id: params[:id])
            @user = User.find_by(id: params[:id]) # find_by returns "null", find makes an error
        else
            redirect to '/login'
        end
        erb :'users/ask_question'
    end

    get '/login' do 
        erb :'users/login' # Login landing page.
        
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        user && user.authenticate(params[:password])
        redirect to "/users/#{user.id}"
        #erb :'users/login'  # if fails start again
    end

    get '/logout' do
        # destroy/clear session and redirect to ('/')
        session.destroy
        redirect to ('/')
    end

end