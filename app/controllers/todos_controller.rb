class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: Todo.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    render plain: Todo.find(id).to_pleasant_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
    )
    render plain: "New todo has been created with ID #{new_todo.id}"
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    render plain: "Status of todo with ID #{todo.id} has been changed to #{todo.completed}"
  end
end
