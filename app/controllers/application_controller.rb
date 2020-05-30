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

end