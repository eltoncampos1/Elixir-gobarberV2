    defmodule Gobarber.Appointments.Create do
      alias Gobarber.{Appointment, Repo}
      alias Gobarber.Appointments.Find

      def call(params) do
        case validate_date_availability(params) do
          {:error, reason} ->
            {:error, reason}

          {:ok, _} ->
            params
            |> Appointment.changeset()
            |> Repo.insert()
            |> handle_insert()
        end
      end

      defp handle_insert({:ok, %Appointment{} = result}), do: {:ok, result}
      defp handle_insert({:error, result}), do: {:error, result}

      defp validate_date_availability(%{provider: _provider, date: date} = _params) do
        case Find.by_date(date) do
          %Appointment{} -> {:error, "Appointment already booked"}
          nil -> {:ok, nil}
        end
      end
    end
