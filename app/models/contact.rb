class Contact < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :role
  validates_presence_of :email

  belongs_to :company
end