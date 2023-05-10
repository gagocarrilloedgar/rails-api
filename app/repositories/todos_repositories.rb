class TodoRepository
  def self.all
    Todo.all
  end

  def self.find(id)
    Todo.find(id)
  end

  def self.create(params)
    Todo.create(params)
  end

  def self.update(todo, params)
    todo.update(params)
  end

  def self.destroy(todo)
    todo.destroy
  end
end
