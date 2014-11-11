class Task < ActiveRecord::Base
  has_and_belongs_to_many :states

  TASK_TYPE_BEFORE = 'before'
  TASK_TYPE_AFTER = 'after'
end
