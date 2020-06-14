class UsersController < ApplicationController
      
    get '/create_account' do
        if logged_in?
            redirect to "/users/#{current_account.id}"
        else
            erb :'users/create_account'     
        end
    end

    post '/create_account' do
        # binding.pry #check that I have created a user
        # @user = User.create(username: params[:username], email: params[:email], password: params[:password])
        @user = User.create(params)
        if @user.valid? 
            session[:user_id] = @user.id # session = user id
            redirect to "/users/#{@user.id}"
        else 
            @errors = @user.errors.full_messages
            erb :'users/create_account'  # if fails start again
        end    
    end

    get '/login' do 
        # binding.pry
        if logged_in?
            redirect to "/users/#{current_account.id}"
        end
            erb :'users/login'
    end

    post '/login' do
        @user = User.find_by(email: params[:email])
       
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to "/users/#{@user.id}"
        else
            @errors = "[\"Incorrect email and/or password\"]"
            erb :'users/login'  # if fails start again
        end
        
    end

    get '/users/:id' do # dynamic route with argument of the users_id
        # binding.pry 
        if logged_in? && User.find_by(id: params[:id])
            @user = User.find_by(id: params[:id]) # find_by returns "null", find makes an error
        else
            redirect to '/login'
        end
        erb :'users/ask_question'
    end

    get '/users/:id/answer' do
        erb :'users/eightball_answer'
    end

    post 'users/:id/answer' do
        erb :'users/eightball_answer'
    end


    get '/logout' do
        # destroy/clear session and redirect to ('/')
        session.destroy
        redirect to ('/')
    end

end