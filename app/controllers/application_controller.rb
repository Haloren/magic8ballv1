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
        erb :welcome
    end

    helpers do
        def current_account
            @current_account ||= User.find_by(id: session[:user_id])
        end

        def logged_in?
            !!current_account
        end

        def display_logged_in_user
            if User.find_by(id: params[:id])
                @user.username
            else
                " "
            end
        end
    end

end