class CreateRaps < ActiveRecord::Migration[6.0]
  def change
    create_table :raps do |t|

      t.timestamps
      t.string :pace,null: false
      t.string :m200
      t.string :m400
      t.string :m600
      t.string :m800
      t.string :m1000
      t.string :m1200
      t.string :m1400
      t.string :m1600
      t.string :m1800
      t.string :m2000
      t.string :m2200
      t.string :m2400
      t.string :m2600
      t.string :m2800
      t.string :m3000
      t.string :m3200
      t.references :race,foreign_key: true

    end
  end
end
