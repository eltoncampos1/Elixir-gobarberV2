defmodule GobarberWeb.FallbackController do
  use GobarberWeb, :controller

  alias Gobarber.Error
  alias GobarberWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
