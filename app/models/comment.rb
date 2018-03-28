class Comment < ApplicationRecord
  validates_presence_of :comment
  belongs_to :job
end
