defmodule Timemanager.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :profile, :string

      timestamps(type: :utc_datetime)
    end
  end
end
