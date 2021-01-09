class Post < ApplicationRecord
	belongs_to :user
	belongs_to :village
	belongs_to :job
end
