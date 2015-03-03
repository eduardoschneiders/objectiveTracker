class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  scope :active, -> { where(deleted: nil) }
  scope :uncompleted, -> { where(deleted: nil, completed: nil) }
  scope :completed, -> { where(deleted: nil, completed: true) }
end
