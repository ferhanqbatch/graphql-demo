class Mobile < ApplicationRecord
  has_many :links, dependent: :destroy
end
