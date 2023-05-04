class User < ApplicationRecord
	has_many :app_opens
	has_one :account ,dependent: :destroy
	has_one :userprofile,dependent: :destroy
end
