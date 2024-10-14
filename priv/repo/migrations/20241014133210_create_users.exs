defmodule Timemanager.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :profile_id, references(:profiles, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:users, [:profile_id])
  end
end
