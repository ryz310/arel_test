class Foo < ActiveRecord::Base
	has_many :bars
	has_many :bazs, through: :bars
end
