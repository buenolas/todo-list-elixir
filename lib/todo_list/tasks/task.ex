defmodule TodoList.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :title, :string
    field :completed, :boolean, default: false
    field :user_id, :id  # Apenas o campo user_id, sem a associação

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :completed, :user_id])
    |> validate_required([:title, :completed, :user_id])
    |> foreign_key_constraint(:user_id)  # Use foreign_key_constraint aqui
  end
end
