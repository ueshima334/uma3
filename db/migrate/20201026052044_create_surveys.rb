class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|

      t.timestamps
      t.string :title,null:false
      t.string :item1,null:false
      t.string :item2,null:false
      t.string :item3
      t.string :item4
      t.references :user,foreign_key: true

    end
  end
end
