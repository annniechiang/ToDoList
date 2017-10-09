class Todolist < ApplicationRecord
  validates_presence_of :task, :due_date, :note
end
