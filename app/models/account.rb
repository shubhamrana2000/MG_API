class Account < ApplicationRecord
	belongs_to :user
	has_many :withdrawl_histories ,dependent: :destroy
	has_many :points_histories ,dependent: :destroy
end
