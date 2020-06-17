class AnswerListsController < ApplicationController

    post '/answer' do
        # binding.pry
        @user = current_account
        
        #INSTANCE VARIABLE FOR QUESTION PROVIDED BY USER
        @question = params[:question] 

        # binding.pry
        #@ANSWERS NEEDS TO BE POPULATED WITH THE @LIST_NAME ANSWERS ARRAY
        answer_list = AnswerList.find_by(id: params[:list_id])
        if answer_list 
            @answers = answer_list.answers.sample
        else
            redirect '/ask_the_eightball'
        end

        erb :'users/eightball_answer'
    end

    get '/answerlists' do
        # binding.pry
        if logged_in?
            @user = current_account
            @answer_lists = @user.answer_lists
            # binding.pry
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

        # FILTERING PARAMS TO GET NEW FILTERED ARRAY
        answers = params[:answers].select {|answer| answer!=""}

        # Asign answers to an answer_list_id
        answers.each do |answer|
            Answer.create(content: answer, answer_list_id: @answer_list.id)
        end
        # save the array to an instance variable
        #Answer.all.select {|answer| answer.answer_list_id == @answer_list.id}
        @answers = AnswerList.last.answers
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
        
        redirect to '/answerlists'
    end
    
end