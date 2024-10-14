defmodule Timemanager.ContextUserTest do
  use Timemanager.DataCase

  alias Timemanager.ContextUser

  describe "users" do
    alias Timemanager.ContextUser.User

    import Timemanager.ContextUserFixtures

    @invalid_attrs %{name: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert ContextUser.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert ContextUser.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %User{} = user} = ContextUser.create_user(valid_attrs)
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ContextUser.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %User{} = user} = ContextUser.update_user(user, update_attrs)
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = ContextUser.update_user(user, @invalid_attrs)
      assert user == ContextUser.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = ContextUser.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> ContextUser.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = ContextUser.change_user(user)
    end
  end
end
