class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :body_md
      t.text :body_html
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
