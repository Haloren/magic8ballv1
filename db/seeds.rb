AnswerList.create(list_name: "Magic Eight Ball", user_id: 1)

answers = [
    {content: "As I see it, yes.", answer_list_id: 1},
    {content: "Ask again later.", answer_list_id: 1},
    {content: "Better not tell you now.", answer_list_id: 1},
    {content: "Cannot predict now.", answer_list_id: 1},
    {content: "Concentrate and ask again.", answer_list_id: 1},
    {content: "Don’t count on it.", answer_list_id: 1},
    {content: "It is certain.", answer_list_id: 1},
    {content: "It is decidedly so.", answer_list_id: 1},
    {content: "Most likely.", answer_list_id: 1},
    {content: "My reply is no.", answer_list_id: 1},
    {content: "My sources say no.", answer_list_id: 1},
    {content: "Outlook not so good.", answer_list_id: 1},
    {content: "Outlook good.", answer_list_id: 1},
    {content: "Reply hazy, try again.", answer_list_id: 1},
    {content: "Signs point to yes.", answer_list_id: 1},
    {content: "Very doubtful.", answer_list_id: 1},
    {content: "Without a doubt.", answer_list_id: 1},
    {content: "Yes.", answer_list_id: 1},
    {content: "Yes – definitely.", answer_list_id: 1},
    {content: "You may rely on it.", answer_list_id: 1},
]

answers.each do |answer|
    Answer.create(answer)
end