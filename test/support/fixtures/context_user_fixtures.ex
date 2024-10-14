defmodule Timemanager.ContextUserFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Timemanager.ContextUser` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Timemanager.ContextUser.create_user()

    user
  end
end
