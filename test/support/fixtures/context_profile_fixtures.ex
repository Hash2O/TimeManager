defmodule Timemanager.ContextProfileFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Timemanager.ContextProfile` context.
  """

  @doc """
  Generate a profile.
  """
  def profile_fixture(attrs \\ %{}) do
    {:ok, profile} =
      attrs
      |> Enum.into(%{
        profile: "some profile"
      })
      |> Timemanager.ContextProfile.create_profile()

    profile
  end
end
