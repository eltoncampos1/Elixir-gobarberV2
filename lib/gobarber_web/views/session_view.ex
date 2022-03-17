defmodule GobarberWeb.SessionView do
  use GobarberWeb, :view

  def render("show.json", %{user: user, token: token}) do
    %{
      user: user,
      token: token
    }
  end
end
