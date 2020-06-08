class Answer_List < ActiveRecord::Base
    
    belongs_to :user
    has_many :answers

end