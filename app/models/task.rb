class Task < ActiveRecord::Base
  belongs_to :status
  belongs_to :group
  belongs_to :user
  has_many :comments
  has_many :notes

  def self.task_qty(group_id)
    @lcl_tasks = Task.where("group_id=?", group_id)
    @lcl_tasks.length.to_s

  end

end
