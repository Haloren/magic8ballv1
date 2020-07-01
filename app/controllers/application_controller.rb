require './config/environment'

class ApplicationController < Sinatra::Base

    configure do 
        set :public_folder, "public"
        set :views, "app/views"
        enable :sessions #allows you to call a sessions hash anywhere
        # binding.pry
        set :session_secret, ENV['SESSION_SECRET']
    end

    get "/" do
        # binding.pry
        if logged_in?
            redirect to "/ask_the_eightball"
        else 
            erb :'users/login'
        end
    end
    
    helpers do 
        def current_account
            # binding.pry
            # check for a current account or find it 
            # if @current_account then @current_account or/else @current_account = User's session user id
            @current_account ||= User.find_by_id(session[:user_id])
        end
       
        def logged_in?
            !!current_account #nil into false & user object true
        end

        def authenticate
            redirect '/login' if !logged_in?
        end

        def default_answers
            @default = ["As I see it, yes.",
                "Ask again later.",
                "Better not tell you now.",
                "Cannot predict now.",
                "Concentrate and ask again.",
                "Don’t count on it.",
                "It is certain.",
                "It is decidedly so.",
                "Most likely.",
                "My reply is no.",
                "My sources say no.",
                "Outlook not so good.",
                "Outlook good.",
                "Reply hazy, try again.",
                "Signs point to yes.",
                "Very doubtful.",
                "Without a doubt.",
                "Yes.",
                "Yes – definitely.",
                "You may rely on it."].sample
        end

        # check if a list !exists || list user != 
        # redirect to /ask_the_eightball
        def check_list 
            if !@list || @list.user != current_account
                redirect to '/ask_the_eightball'
            end
        end

    end
    
end