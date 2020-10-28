class CreateHorses < ActiveRecord::Migration[6.0]
  def change
    create_table :horses do |t|

      t.timestamps
      t.text :name,null: false
      t.integer :horsegender_id,null: false
      t.date :birthday,null: false
    end
  end
end
