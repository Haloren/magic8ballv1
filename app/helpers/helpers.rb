class Helpers

    # def current_account
    #     @current_account ||= User.find_by(id: session[:user_id])
    # end
    def self.current_account(session)
        User.find_by(id: session[:user_id])
    end
    
    # def logged_in?
    #     !!current_account 
    # end
    def self.logged_in?(session)
        !!session[:user_id] # !! instead of ? true : false
    end

end