defmodule Gobarber.Appointments.Find do
  alias Gobarber.{Appointment, Repo}

  def by_date(date) do
    Repo.get_by(Appointment, date: date)
  end
end
