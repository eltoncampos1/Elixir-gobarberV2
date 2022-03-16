defmodule GobarberWeb.UsersController do
  use GobarberWeb, :controller

  alias Gobarber.Users
  alias GobarberWeb.FallbackController

  action_fallback FallbackController

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, params) do
    with {:ok, user} <- Users.Create.call(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
