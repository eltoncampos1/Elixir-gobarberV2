defmodule Gobarber.Appointments.Create do
  alias Gobarber.{Appointment, Repo}

  def call(params) do
    params
    |> Appointment.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Appointment{} = result}), do: {:ok, result}
  defp handle_insert({:error, result}), do: {:error, result}
end
