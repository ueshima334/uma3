class Horse < ApplicationRecord
  belongs_to_active_hash :horsegender

  with_options presence: { message: 'を入力してください' } do
    validates :name
    validates :birthday
  end

  validate :horsegender, numericality: { other_than: 1, message: 'を入力してください' } 

end
