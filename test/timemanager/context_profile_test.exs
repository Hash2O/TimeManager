defmodule Timemanager.ContextProfileTest do
  use Timemanager.DataCase

  alias Timemanager.ContextProfile

  describe "profiles" do
    alias Timemanager.ContextProfile.Profile

    import Timemanager.ContextProfileFixtures

    @invalid_attrs %{profile: nil}

    test "list_profiles/0 returns all profiles" do
      profile = profile_fixture()
      assert ContextProfile.list_profiles() == [profile]
    end

    test "get_profile!/1 returns the profile with given id" do
      profile = profile_fixture()
      assert ContextProfile.get_profile!(profile.id) == profile
    end

    test "create_profile/1 with valid data creates a profile" do
      valid_attrs = %{profile: "some profile"}

      assert {:ok, %Profile{} = profile} = ContextProfile.create_profile(valid_attrs)
      assert profile.profile == "some profile"
    end

    test "create_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ContextProfile.create_profile(@invalid_attrs)
    end

    test "update_profile/2 with valid data updates the profile" do
      profile = profile_fixture()
      update_attrs = %{profile: "some updated profile"}

      assert {:ok, %Profile{} = profile} = ContextProfile.update_profile(profile, update_attrs)
      assert profile.profile == "some updated profile"
    end

    test "update_profile/2 with invalid data returns error changeset" do
      profile = profile_fixture()
      assert {:error, %Ecto.Changeset{}} = ContextProfile.update_profile(profile, @invalid_attrs)
      assert profile == ContextProfile.get_profile!(profile.id)
    end

    test "delete_profile/1 deletes the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{}} = ContextProfile.delete_profile(profile)
      assert_raise Ecto.NoResultsError, fn -> ContextProfile.get_profile!(profile.id) end
    end

    test "change_profile/1 returns a profile changeset" do
      profile = profile_fixture()
      assert %Ecto.Changeset{} = ContextProfile.change_profile(profile)
    end
  end
end
