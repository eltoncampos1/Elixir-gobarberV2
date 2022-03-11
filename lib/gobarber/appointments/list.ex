defmodule Gobarber.Appointments.List do
  alias Gobarber.{Appointment, Repo}

  def call() do
    Repo.all(Appointment)
  end
end
