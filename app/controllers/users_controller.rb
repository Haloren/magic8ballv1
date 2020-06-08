class UsersController < ApplicationController
#get and post for: /login and /create_account
#get /logout
    get '/create_account' do
        erb :'users/create_account' #Create Account landing page.
        
    end

    post '/create_account' do
        # redirect to ('/index')
        #erb :'users/create_account'  #if fails start again
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