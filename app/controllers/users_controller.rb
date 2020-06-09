class UsersController < ApplicationController
    
    get '/create_account' do
        erb :'users/create_account' #Create Account landing page.
        
    end

    post '/create_account' do
        # binding.pry #to check that I have created a user
        # @user = User.create(username: params[:username], email: params[:email], password: params[:password])
        @user = User.create(params) #using all the params for User so don't need to call each individually
        redirect to "/users/#{user.id}"
        #erb :'users/create_account'  #if fails start again
    end

    get '/users/:id' do
        # binding.pry
        @user = User.find_by(id: params[:id]) #find_by returns "null", find makes an error
        erb :'users/index'
    end

    get '/login' do 
        erb :'users/login' #Login landing page.
        
    end

    post '/login' do
        # redirect to ('/index')
        #erb :'users/login'  #if fails start again
    end

    get '/logout' do
        #destroy/clear session and redirect to ('/')
        session.destroy
        redirect to ('/')
    end

end