# Rails convention is to use singular names for models
# that map to the pluralized version of the name as the table name
# User -> users table
# Category -> categories
# Wolf -> wolves
class User < ApplicationRecord
  # Rails will automatically `pick up` and set attributes based
  # on the columns in the table

  has_secure_password
  # the line above `has_secure_password` adds lots of things to our model:
  # 1- it adds two virtual attributes (ones that don't map to DB columns), which are 
  #    password & password_confirmation
  # 2- It validates that password must exist
  # 3- If you include `password_confirmation`, it ensures that it matches `password`
  # 4- It generates random salt, hashes the salt + password and stores the result in a DB field
  #    that is called `password_digest`

  # Validations
  validates(:first_name, { presence: true })
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
end
