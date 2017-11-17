class Item < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: true

  # virtual attribute for all_tags belonging to an item (setter method)
  def all_tags=(names)
    self.tags = names.split(",").map do |tag|
      Tag.where(name: tag.strip.capitalize).first_or_create!
    end
  end

  # virtual attribute for all_tags belonging to an item (getter method)
  def all_tags
    self.tags.map(&:name).join(", ")
  end

  # checking if the item given by the name is already present or not
  def item_present?(name)
    return true if Item.find_by_name(name).present?
    return false
  end
end
