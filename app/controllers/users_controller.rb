class UsersController < ApplicationController
#get and post for: /login and /create_account
#get /logout
    get '/create_account' do
        "Create Account landing page."
    end

    post '/create_account' do

    end

    get '/login' do 
        "Login landing page."
    end

    post '/login' do

    end

    get '/logout' do
        "Logout" #redirect to ('/')
    end

end