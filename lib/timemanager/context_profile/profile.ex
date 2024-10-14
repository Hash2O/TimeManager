defmodule Timemanager.ContextProfile.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profiles" do
    field :profile, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:profile])
    |> validate_required([:profile])
  end
end
