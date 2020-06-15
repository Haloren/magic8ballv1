require './config/environment'

class ApplicationController < Sinatra::Base

    configure do 
        set :public_folder, "public"
        set :views, "app/views"
        enable :sessions #allows you to call a sessions hash anywhere
        set :session_secret, "8BallSecret" # "#{ENV['SESSION_SECRET']}"
    end

    get "/" do
        # binding.pry
        if logged_in?
            redirect to "/users/:id"
        else 
            erb :'users/login'
        end
    end
    
    helpers do 
        def current_account
            @current_account ||= User.find_by_id(session[:user_id])
        end
       
        def logged_in?
            !!current_account #nil into false & user object true
        end

        def authenticate
            redirect '/login' if !logged_in?
        end

    end
    
end