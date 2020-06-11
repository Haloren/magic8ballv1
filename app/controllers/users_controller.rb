class UsersController < ApplicationController
      
    get '/create_account' do
        if Helpers.logged_in?(session)
            user = Helpers.current_user(session)
            redirect to "/users/#{user.id}"
        else
            erb :'users/create_account'     
        end

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
        if Helpers.logged_in?(session)
            user = Helpers.current_user(session)
            redirect to "/users/#{user.id}"
        end
            erb :'users/login'
    end

    post '/login' do
        user = User.find_by(email: params[:email])
       
        if user && user.authenticate(params[:password])
            redirect to "/users/#{user.id}"
        else
            erb :'users/login'  # if fails start again
        end
        
    end

    get '/logout' do
        # destroy/clear session and redirect to ('/')
        session.destroy
        redirect to ('/')
    end

end