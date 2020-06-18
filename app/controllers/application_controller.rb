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
            #check for a current account or find it 
            @current_account ||= User.find_by_id(session[:user_id])
        end
       
        def logged_in?
            !!current_account #nil into false & user object true
        end

        def authenticate
            redirect '/login' if !logged_in?
        end

        def default_list
        list_name: "Magic Eight Ball"

        answers = [
            {content: "As I see it, yes.", answer_list_id: 1},
            {content: "Ask again later.", answer_list_id: 1},
            {content: "Better not tell you now.", answer_list_id: 1},
            {content: "Cannot predict now.", answer_list_id: 1},
            {content: "Concentrate and ask again.", answer_list_id: 1},
            {content: "Don’t count on it.", answer_list_id: 1},
            {content: "It is certain.", answer_list_id: 1},
            {content: "It is decidedly so.", answer_list_id: 1},
            {content: "Most likely.", answer_list_id: 1},
            {content: "My reply is no.", answer_list_id: 1},
            {content: "My sources say no.", answer_list_id: 1},
            {content: "Outlook not so good.", answer_list_id: 1},
            {content: "Outlook good.", answer_list_id: 1},
            {content: "Reply hazy, try again.", answer_list_id: 1},
            {content: "Signs point to yes.", answer_list_id: 1},
            {content: "Very doubtful.", answer_list_id: 1},
            {content: "Without a doubt.", answer_list_id: 1},
            {content: "Yes.", answer_list_id: 1},
            {content: "Yes – definitely.", answer_list_id: 1},
            {content: "You may rely on it.", answer_list_id: 1},
        ]
        end

    end
    
end