class AnswerListsController < ApplicationController

    post '/answer' do
        @user = current_account
        erb :'users/eightball_answer'
    end

    get '/answerlists' do
        if logged_in?
            @user = current_account
            #@answerlists = current_account.answerlists
            erb :'answer_lists/select_list'
        else
            redirect to '/login'
        end
    end

    post '/answerlists' do
        if logged_in? 
            @user = current_account
            @answer_list = current_account.answer_lists.build(params)
            session[:user_id] = @user.id # session = user id
            redirect to "/answerlists"
        else 
            @errors = @user.errors.full_messages
            erb :'answer_lists/new_list'  # if fails start again
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
        erb :'answer_lists/select_list'
    end

    get '/answerlists/:id/edit' do
        erb :'answer_lists/update_list'
    end

    patch '/answerlists/:id' do
        erb :'answer_lists/update_list'
    end

    delete '/answerlists/:id/delete' do
        @user = current_account
        @answer_list = AnswerList.find(params[:id])
        @answer_list.destroy
        redirect to '/answerlists'
    end
    
end