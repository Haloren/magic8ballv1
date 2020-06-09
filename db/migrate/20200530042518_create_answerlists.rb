class CreateAnswerlists < ActiveRecord::Migration[6.0]
  def change
    create_table :answer_lists do |t|
      t.string :list_name
      t.integer :user_id #answer list belongs to a user (user.answer_list will provide lists that belong to a user)
    end
  end
end
