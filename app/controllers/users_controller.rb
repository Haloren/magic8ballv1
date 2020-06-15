class UsersController < ApplicationController
      
    get '/create_account' do
        if logged_in?
            redirect to "/ask_the_eightball"
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
            redirect to "/ask_the_eightball"
        else 
            @errors = @user.errors.full_messages
            erb :'users/create_account'  # if fails start again
        end    
    end

    get '/login' do 
        # binding.pry
        if logged_in?
            redirect to "/ask_the_eightball"
        end
            erb :'users/login'
    end

    post '/login' do
        @user = User.find_by(email: params[:email])
       
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to "/ask_the_eightball"
        else
            @errors = "[\"Incorrect email and/or password\"]"
            erb :'users/login'  # if fails start again
        end
        
    end

    get '/ask_the_eightball' do
        # binding.pry
        authenticate
        if logged_in?
            @user = current_account
            erb :'users/ask_question'
        else
            redirect to '/login'
        end
        # @user = current_account
        # erb :'users/ask_question'
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