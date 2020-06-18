class AnswerListsController < ApplicationController

    post '/answer' do
        # binding.pry
        @user = current_account
        
        #INSTANCE VARIABLE FOR QUESTION PROVIDED BY USER
        @question = params[:question] 
        default = params[:list_id]

        # binding.pry
        if default == "default"
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
        else
            # binding.pry
            #@ANSWERS NEEDS TO BE POPULATED WITH AN ARRAY
            answer_list = AnswerList.find_by(id: params[:list_id])
            if answer_list
                @answers = answer_list.answers.select { |answer| answer.content != ""}
                @answer = @answers.sample
            else
                redirect '/ask_the_eightball'
            end
            # binding.pry
        end
        erb :'users/eightball_answer'
    end

    get '/answerlists' do
        # binding.pry
        if logged_in?
            @user = current_account
            @answer_lists = @user.answer_lists
            erb :'answer_lists/select_list'
        else
            redirect to '/login'
        end
    end

    post '/answerlists' do
        # binding.pry
        @user = current_account
        # INSTANTIATE NEW ANSWERLIST INSTANCE BASED ON PARAMS
        @answer_list = AnswerList.create(list_name: params[:list_name], user_id: @user.id)

        
        # Asign answers to an answer_list_id
        params[:answers].each do |answer|
            Answer.create(content: answer, answer_list_id: @answer_list.id)
        end

        # FILTERING PARAMS TO GET NEW FILTERED ARRAY
        # answers = params[:answers].select {|answer| answer!=""}

        # save the array to an instance variable
        #Answer.all.select {|answer| answer.answer_list_id == @answer_list.id}
        @answers = @answer_list.answers.select {|answer| answer!=""}
        # binding.pry
        erb :'/answer_lists/select_list' 
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
        # binding.pry
        if logged_in?
            @user = current_account 
            @list = AnswerList.find_by(id: params[:id])
            # binding.pry
            erb :'answer_lists/update_list'
        else 
            redirect to '/login'
        end
    end
    
    patch '/answerlists/:id' do
        @user = current_account
        @list = AnswerList.find_by(id: params[:id])
        # binding.pry
        counter = 0
        while counter < 20
            old_answer = @list.answers[counter].content
            new_answer = params[:answers][counter]
            # binding.pry
            if old_answer != new_answer
                @list.answers[counter].content = params[:answers][counter]
                @list.answers[counter].save
            end
            counter += 1
        end
        # binding.pry
        @list.save

        erb :'answer_lists/select_list'
    end

    delete '/answerlists/:id/delete' do
        @user = current_account
        # binding.pry
        @list = AnswerList.find_by(id: params[:id])
        @list.destroy
        
        redirect to '/answerlists'
    end
    
end