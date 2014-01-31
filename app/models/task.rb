class Task < ActiveRecord::Base
  belongs_to :status
  belongs_to :group
  belongs_to :user
  has_many :comments
  has_many :notes

end
