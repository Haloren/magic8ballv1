require './config/environment'

class ApplicationController < Sinatra::Base

    configure do 
        set :public_folder, "public"
        set :views, "app/views"
        enable :sessions #allows you to call a sessions hash anywhere
        set :session_secret, "8BallSecret"
    end

    get "/" do
        # binding.pry
        if logged_in?
            redirect to '/users/:id'
        else 
            erb :welcome #v2 erb :user/login
        end
    end
    
    helpers do 
        def current_account
            @current_account ||= User.find_by(id: session[:user_id])
        end
        # def self.current_account(session)
        #     User.find_by(id: session[:user_id])
        # end
        def logged_in?
            !!current_account 
        end
        # def self.logged_in?(session)
        #     session[:user_id] ? true : false
        # end
    end
    
end