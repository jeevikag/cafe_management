class Menu < ActiveRecord::Base
  validates :name, presence: true
  has_many :menuitems

  def self.displayable
    menus = Menu.order(:id).map { |menu| [menu.name, menu.id] }
    menus.unshift(["Select Menu", ""])
    return menus
  end
end
