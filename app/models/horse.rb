class Horse < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :horsegender
  belongs_to_active_hash :age


  validates :name, presence: { message: 'を入力してください' } 
    


  with_options numericality: { other_than: 1, message: 'を入力してください' } do
  validates :horsegender_id
  validates :age_id
  end

end
