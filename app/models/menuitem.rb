class Menuitem < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true

  belongs_to :menu
  has_many :order_items

  #def self.of_menu(menu)
  # all.where(menuitem_id: menuitem.id)
  #end
end
