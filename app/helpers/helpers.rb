class Helpers

    # def current_account
    #     @current_account ||= User.find_by(id: session[:user_id])
    # end
    def self.current_user(session)
        User.find_by(id: session[:user_id])
    end
    
    # def logged_in?
    #     !!current_account #user !! instead of true:false
    # end
    def self.logged_in?(session)
        session[:user_id] ? true : false
    end

end