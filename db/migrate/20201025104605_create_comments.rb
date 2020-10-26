class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|

      t.timestamps
      t.references :user,foreign_key: true
      t.references :post,foreign_key: true
      t.string :text,null: false

    end
  end
end
