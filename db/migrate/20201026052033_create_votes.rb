class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|

      t.timestamps
      t.integer :select,null: false
      t.references :user,foreign_key: true
      t.references :survey,foreign_key: true
    end
  end
end
