defmodule GobarberWeb.SessionController do
  use GobarberWeb, :controller
  alias GobarberWeb.Auth.Guardian
  alias GobarberWeb.FallbackController

  def create(conn, %{"email" => email, "password" => password}) do
    with {:ok, user, token} <- Guardian.authenticate(email, password) do
      conn
      |> put_status(:created)
      |> render("show.json", %{user: user, token: token})
    end
  end
end
