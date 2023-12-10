class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :age
      t.string :user_name
      t.string :email
      t.string :phone
      t.string :address_street
      t.string :address_county
      t.string :college
      t.string :course
      t.string :year

      t.timestamps
    end
  end
end
