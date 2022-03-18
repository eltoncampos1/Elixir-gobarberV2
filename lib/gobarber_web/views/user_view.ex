defmodule GobarberWeb.UserView do
  use GobarberWeb, :view

  alias Gobarber.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created!",
      user: user
    }
  end

  def render("show.json", %{users: users}) do
    %{
      data:
        Enum.map(users, fn user ->
          %{
            user: user
          }
        end)
    }
  end
end
