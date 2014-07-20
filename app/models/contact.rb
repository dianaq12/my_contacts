class Contact < ActiveRecord::Base
  has_many :addresses

  accepts_nested_attributes_for :addresses, :allow_destroy => true

  scope :starting_with, ->(letter) { where("last_name like '#{letter}%'")}

  def name
    "#{first_name} #{last_name}"
  end

  def address
    self.addresses.first if self.addresses.present?
  end
end
