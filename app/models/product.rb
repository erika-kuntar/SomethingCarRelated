class Product < ApplicationRecord
  has_many :listings, dependent: :destroy

  def self.alphabetical
    order("name")
  end

  def self.search_by(search_term)
    where("LOWER(name) LIKE :search_term", search_term: "%#{search_term.downcase}%")
  end
end
