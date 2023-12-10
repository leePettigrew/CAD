json.extract! person, :id, :first_name, :last_name, :gender, :age, :user_name, :email, :phone, :address_street, :address_county, :college, :course, :year, :created_at, :updated_at
json.url person_url(person, format: :json)
