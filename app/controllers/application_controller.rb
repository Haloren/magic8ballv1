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
        erb :welcome #v2 erb :user/login
    end

end