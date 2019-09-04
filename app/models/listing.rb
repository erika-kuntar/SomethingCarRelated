class Listing < ApplicationRecord
  belongs_to :product
  def self.search_by(search_term)
    where("LOWER(model) | LOWER(year) LIKE :search_term", search_term: "%#{search_term.downcase}%")
  end
end
