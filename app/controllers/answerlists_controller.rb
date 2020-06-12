class AnswerListsController < ApplicationController

    get '/lists/new' do
        
        if !Helpers.logged_in?(session)
            redirect '/'
        end
        
        erb :'answer_lists/select_list'
        
    end
       
    get '/answerlists' do
        @lists = AnswerLists.all
        erb :'answer_lists/select_list'
    end

    post '/answerlists' do

    end
    
    get '/answer' do
        erb :'users/eightball_answer'
    end

    post '/answer' do
        erb :'users/eightball_answer'
    end
    
end