class AnswerListsController < ApplicationController

    post '/answer' do
        # binding.pry
        @question = params[:question]
        @user = current_account
        @answers = ["As I see it, yes.",
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
            "You may rely on it."
        ]
        erb :'users/eightball_answer'
    end

    get '/answerlists' do
        if logged_in?
            @user = current_account
            #@answerlists = current_account.answer_lists
            erb :'answer_lists/select_list'
        else
            redirect to '/login'
        end
    end

    post '/answerlists' do
        binding.pry
        @user = current_account

        @list = AnswerList.create(params)   # .create , .build , .new & save 
        if @list.valid?
            session[answer_list_id] = @answer_list.id
            redirect to '/answerlists'
        else
            @errors = @answer_list.errors.full_messages
            erb :'answer_lists/new_list'
        end        
    end

    get '/answerlists/new' do
        if logged_in?
            @user = current_account
            erb :'answer_lists/new_list'
        else
            redirect to '/login'
        end  
    end
       
    get '/answerlists/:id' do
        @user = current_account
        erb :'answer_lists/select_list'
    end

    get '/answerlists/:id/update' do
        if logged_in?
            @user = current_account 
            erb :'answer_lists/update_list'
        else 
            redirect to '/login'
        end
    end

    patch '/answerlists/:id' do
        @user = current_account
        erb :'answer_lists/update_list'
    end

    delete '/answerlists/:id/delete' do
        @user = current_account
        @answer_list = AnswerList.find(params[:id])
        if logged_in? && @answer_list.user == current_account
            @answer_list.destroy
            redirect to '/answerlists'
        else
            redirect to '/login'
        end
    end
    
end