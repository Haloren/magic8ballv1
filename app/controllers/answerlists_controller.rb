class AnswerListsController < ApplicationController

    get '/answer' do
        erb :'users/eightball_answer'
    end

    post '/answer' do
        erb :'users/eightball_answer'
    end
    
    get '/lists/new' do
        erb :'answer_lists/select_list'
        
    end
       
    post '/lists' do

    end

end