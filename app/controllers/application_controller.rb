require './config/environment'

class ApplicationController < Sinatra::Base

    configure do 
        set :public_folder, "public"
        set :views, "app/views"
        enable :sessions
        set :session_secret, "8BallSecret"
    end

    get "/" do
        erb :welcome
    end

    helpers do
        def current_account
            @current_account ||= User.find_by(id: session[:user_id])
        end

        def logged_in?
            !!current_account
        end
    end

end