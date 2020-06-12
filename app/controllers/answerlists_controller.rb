class AnswerListsController < ApplicationController

    get '/answerlists' do
        if logged_in?
            erb :'answer_lists/select_list'
        else
            redirect to '/login'
        end
    end

    post '/answerlists' do

    end

    get '/answerlists/new' do
        if !Helpers.logged_in?(session)
            redirect '/'
        end
        erb :'answer_lists/new_list'
    end
       
    get '/answerlists/:id' do

    end

    get '/answerlists/:id/edit' do

    end

    patch '/answerlists/:id' do

    end

    delete '/answerlists/:id/delete' do

    end
    
end