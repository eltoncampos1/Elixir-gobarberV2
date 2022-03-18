defmodule GobarberWeb.AppointmentView do
  use GobarberWeb, :view

  alias Gobarber.Appointment

  def render("create.json", %{appointment: %Appointment{} = appointment}) do
    %{
      message: "Appointment created!",
      appointment: appointment
    }
  end

  def render("show.json", %{appointments: appointments}) do
    %{
      data:
        Enum.map(appointments, fn appointment ->
          %{
            appointment: appointment
          }
        end)
    }
  end
end
