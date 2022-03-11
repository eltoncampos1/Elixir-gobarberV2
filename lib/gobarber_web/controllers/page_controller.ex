defmodule GobarberWeb.PageController do
  use GobarberWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
