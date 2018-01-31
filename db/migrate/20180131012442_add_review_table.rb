class AddReviewTable < ActiveRecord::Migration[5.1]
  def change
    t.string :comment
    t.integer :rating
    
    t.timestamps
  end
end
