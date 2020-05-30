WHAT DOES THIS APP DO?
Decision making app:
	use this as a traditional magic eightball
	make a custom list for fun at parties
	create your own answers to help you make specific decisions

# Models
- User [has_many AnswerLists]
    - Login and Password (user_name, email, password_digest)
- AnswerLists [belongs_to User] 
    - CRUD (Create, Read, Update, Delete) Functionality
- Answers [belongs_to AnswerList]