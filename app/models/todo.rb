class Todo < ActiveRecord::Base
  belongs_to :user
  validates :todo_text, presence: true
  validates :todo_text, length: { minimum: 2 }
  validates :due_date, presence: true

  def due_today?
    due_date == Date.today
  end

  def self.of_user(user)
    all.where(user_id: user.id)
  end

  def self.overdue_todos
    all.where("due_date < ? and (not completed)", Date.today)
  end

  def self.due_today_todos
    all.where("due_date = ?", Date.today)
  end

  def self.due_later_todos
    all.where("due_date > ?", Date.today)
  end

  def self.completed_todos
    all.where(completed: true)
  end

  def self.add_task(task)
    create!(todo_text: task[:todo_text], due_date: Date.today + task[:due_in_days], completed: false)
  end

  def self.mark_as_complete!(todo_id)
    todo = find(todo_id)
    todo.completed = true
    todo.save
    todo
  end
end
