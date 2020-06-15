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

    end

    get '/answerlists/traditional' do
        @user = current_account
        erb :'answer_lists/traditional_list'       
    end

    get '/answerlists/new' do
        if logged_in?
            @user = current_account
            erb :'answer_lists/new_list'
        else
            redirect '/'
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