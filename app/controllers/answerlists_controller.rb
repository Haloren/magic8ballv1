class AnswerListsController < ApplicationController

    get '/answer' do
        erb :'users/eightball_answer'
    end
    
    get '/lists' do
        erb :'answer_lists/create_list'
        
    end
       
    post '/lists' do

    end

end