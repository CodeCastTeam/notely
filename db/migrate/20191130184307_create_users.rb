class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    # by default tables names for model are pluralized
    # this is a Rails convention
    create_table :users do |t|
      # by default Rails will create a primary key `id` for every table
      # it will be integer and it will auto increment
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest

      # by default Rails adds this line which will include two extra fields
      # `created_at` and `updated_at` to our table, they come in very 
      # handy down the road
      t.timestamps
    end
  end
end
