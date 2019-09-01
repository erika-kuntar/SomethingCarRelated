class Product < ApplicationRecord
  has_many :listings, dependent: :destroy

  def self.alphabetical
    order("name")
  end
end
