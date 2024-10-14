defmodule TimemanagerWeb.ProfileController do
  use TimemanagerWeb, :controller

  alias Timemanager.ContextProfile
  alias Timemanager.ContextProfile.Profile

  def index(conn, _params) do
    profiles = ContextProfile.list_profiles()
    render(conn, :index, profiles: profiles)
  end

  def new(conn, _params) do
    changeset = ContextProfile.change_profile(%Profile{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"profile" => profile_params}) do
    case ContextProfile.create_profile(profile_params) do
      {:ok, profile} ->
        conn
        |> put_flash(:info, "Profile created successfully.")
        |> redirect(to: ~p"/profiles/#{profile}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    profile = ContextProfile.get_profile!(id)
    render(conn, :show, profile: profile)
  end

  def edit(conn, %{"id" => id}) do
    profile = ContextProfile.get_profile!(id)
    changeset = ContextProfile.change_profile(profile)
    render(conn, :edit, profile: profile, changeset: changeset)
  end

  def update(conn, %{"id" => id, "profile" => profile_params}) do
    profile = ContextProfile.get_profile!(id)

    case ContextProfile.update_profile(profile, profile_params) do
      {:ok, profile} ->
        conn
        |> put_flash(:info, "Profile updated successfully.")
        |> redirect(to: ~p"/profiles/#{profile}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, profile: profile, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    profile = ContextProfile.get_profile!(id)
    {:ok, _profile} = ContextProfile.delete_profile(profile)

    conn
    |> put_flash(:info, "Profile deleted successfully.")
    |> redirect(to: ~p"/profiles")
  end
end
