class Person < ApplicationRecord

	belongs_to :user




  # Validating presence of attributes
  validates :first_name, :last_name, :gender, :age, :user_name, :email, 
            :phone, :address_street, :address_county, :college, :course, :year, presence: true

  # Validating that first name and last name only contain letters
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  # Validating email format and uniqueness
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  # Validating that age is a number greater than 0
  validates :age, numericality: { only_integer: true, greater_than: 0 }

  # Validating phone number format (assuming a 10-digit format)
  validates :phone, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }

  # Validating that year is a number and not greater than the current year
  validates :year, numericality: { only_integer: true}

  # Add other specific validations as needed
end
