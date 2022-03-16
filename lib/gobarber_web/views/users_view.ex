defmodule GobarberWeb.UsersView do
  use GobarberWeb, :view

  alias Gobarber.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created!",
      user: user
    }
  end
end
