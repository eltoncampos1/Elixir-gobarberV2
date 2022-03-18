defmodule GobarberWeb.AppointmentController do
  use GobarberWeb, :controller

  alias Gobarber.{Appointments, Users}
  alias GobarberWeb.FallbackController

  action_fallback FallbackController

  def index(conn, _params) do
    with appointments <- Appointments.List.call() do
      conn
      |> put_status(:ok)
      |> render("show.json", appointments: appointments)
    end
  end

  def create(conn, params) do
    with {:ok, appointment} <- Appointments.Create.call(params) do
      conn
      |> put_status(:created)
      |> render("create.json", appointment: appointment)
    end
  end
end
