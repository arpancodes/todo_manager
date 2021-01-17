class Todo < ActiveRecord::Base
  def to_pleasant_string
    "#{id}. #{completed ? "[X]" : "[ ]"} #{due_date.to_s(:long)} \t | #{todo_text} "
  end
end
