class CreateTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :taggings do |t|
      t.references :note, null: false, foreign_key: true, index: true
      t.references :tag, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
