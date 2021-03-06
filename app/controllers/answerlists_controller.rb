class AnswerListsController < ApplicationController

    post '/answer' do
        authenticate   
        # binding.pry
        @user = current_account
        
        #INSTANCE VARIABLE FOR QUESTION PROVIDED BY USER
        @question = params[:question] 
        default = params[:list_id]

        # binding.pry
        if default == "default"
            default_answers #HELPER THAT CALLS .SAMPLE ON ALL DEFAULT ANSWERS 

        else
            # binding.pry
            #@ANSWERS NEEDS TO BE POPULATED WITH AN ARRAY
            answer_list = AnswerList.find_by(id: params[:list_id])
            if answer_list
                # look at all answers and filter out blank content
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
        authenticate
        # binding.pry
        # if logged_in?
            @user = current_account
            @answer_lists = @user.answer_lists
            erb :'answer_lists/select_list'
        # else
        #     redirect to '/login'
        # end
    end

    post '/answerlists' do
        authenticate
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
        authenticate
        # if logged_in?
            @user = current_account
            erb :'answer_lists/new_list'
        # else
        #     redirect to '/login'
        # end  
    end
       
    get '/answerlists/:id' do
        authenticate
        @list = AnswerList.find_by(id: params[:id])
        # binding.pry
        
        if @list == nil 
            redirect to '/ask_the_eightball'
        end
        
        if logged_in? && @list.user == current_account

            @user = current_account
            erb :'answer_lists/select_list'

        else 
            redirect to '/login'
        end

    end

    get '/answerlists/:id/update' do
        authenticate
        @list = AnswerList.find_by(id: params[:id])
        #  binding.pry
        
        # if @list == nil
        #     redirect to '/ask_the_eightball'
        # end

        check_list


        @user = current_account
        # binding.pry
        erb :'answer_lists/update_list' 

        
    end
    
    patch '/answerlists/:id' do
        authenticate
        @list = AnswerList.find_by(id: params[:id])
        # binding.pry
        
        if logged_in? && @list.user == current_account

            @user = current_account
            # binding.pry 
            @list.list_name = params[:list_name]

            counter = 0
            while counter < 20
                old_answer = @list.answers[counter].content
                new_answer = params[:answers][counter]
                # binding.pry
                #keep old answer or if changed replace with new answer
                if old_answer != new_answer
                    @list.answers[counter].content = params[:answers][counter]
                    @list.answers[counter].save
                end
                counter += 1
            end
            # binding.pry
            @list.save

            redirect to '/answerlists'
        else
            # redirect to '/login'
            redirect to '/ask_the_eightball'
        end
    end

    delete '/answerlists/:id/delete' do
        authenticate
        @list = AnswerList.find_by(id: params[:id])
        # binding.pry

        if logged_in? && @list.user == current_account
        
            @user = current_account

            @list.destroy
            redirect to '/answerlists'
        
        else 
            # redirect to '/login'
            redirect to '/ask_the_eightball'
        end
    end
    
end