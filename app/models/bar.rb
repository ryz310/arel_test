class Bar < ActiveRecord::Base
  belongs_to :foo
  has_many :bazs
end
