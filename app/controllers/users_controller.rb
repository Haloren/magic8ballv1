class UsersController < ApplicationController
    
    get '/create_account' do
        erb :'users/create_account' #Create Account landing page.
        
    end

    post '/create_account' do
        # binding.pry #check that I have created a user
        # @user = User.create(username: params[:username], email: params[:email], password: params[:password])
        user = User.create(params) # if using all the User params, you don't need to call each individually
        redirect to "/users/#{user.id}"
        #erb :'users/create_account'  #if fails start again
    end

    get '/users/:id' do #dynamic route with argument of the users_id
        #binding.pry 
        @user = User.find_by(id: params[:id]) #find_by returns "null", find makes an error
        erb :'users/ask_question'
    end

    get '/login' do 
        erb :'users/login' #Login landing page.
        
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        user && user.authenticate(params[:password])
        redirect to "/users/#{user.id}"
        #erb :'users/login'  #if fails start again
    end

    get '/logout' do
        #destroy/clear session and redirect to ('/')
        session.destroy
        redirect to ('/')
    end

end