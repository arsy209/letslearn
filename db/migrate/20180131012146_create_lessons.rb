class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.references :skill, foreign_key: true
      t.string :name
      t.string :description
      t.boolean :completed
      t.boolean :paid
      t.string :price

      t.timestamps null: false
    end
  end
end
