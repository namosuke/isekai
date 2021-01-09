class User < ApplicationRecord
	belongs_to :village
	belongs_to :job
end
