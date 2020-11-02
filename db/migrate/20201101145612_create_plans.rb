class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|

      t.timestamps
      t.string :title,null: false
      t.string :grade
      t.string :terms,null: false
      t.date :day,null: false
      t.string :place,null: false
      t.string :horse1
      t.string :horse2
      t.string :horse3
      t.string :horse4
      t.string :horse5
      t.string :horse6
      t.string :horse7
      t.string :horse8
      t.string :horse9
      t.string :horse10
      t.string :horse11
      t.string :horse12
      t.string :horse13
      t.string :horse14
      t.string :horse15
      t.string :horse16
      t.string :horse17
      t.string :horse18

    end
  end
end
