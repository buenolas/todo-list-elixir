defmodule TodoListWeb.TaskController do
  use TodoListWeb, :controller

  alias TodoList.Tasks
  alias TodoList.Tasks.Task
  #alias TodoListWeb.UserAuth



  def index(conn, _params) do
    user = conn.assigns.current_user
    tasks = Tasks.list_tasks(user.id)
    render(conn, :index, tasks: tasks)
  end

  def new(conn, _params) do
    changeset = Tasks.change_task(%Task{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"task" => task_params}) do
    user = conn.assigns.current_user
    task_params = Map.put(task_params, "user_id", user.id)

    case Tasks.create_task(task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: ~p"/tasks/#{task}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = conn.assigns.current_user
    task = Tasks.get_task!(user.id, id)
    render(conn, :show, task: task)
  end

  def edit(conn, %{"id" => id}) do
    user = conn.assigns.current_user
    task = Tasks.get_task!(user.id, id)
    changeset = Tasks.change_task(task)
    render(conn, :edit, task: task, changeset: changeset)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    user = conn.assigns.current_user
    task = Tasks.get_task!(user.id, id)

    case Tasks.update_task(task, task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: ~p"/tasks/#{task}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, task: task, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = conn.assigns.current_user
    task = Tasks.get_task!(user.id, id)
    {:ok, _task} = Tasks.delete_task(task)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: ~p"/tasks")
  end
end
