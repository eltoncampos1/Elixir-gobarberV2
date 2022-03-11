defmodule Gobarber.Repo.Migrations.CreateAppointmentsTable do
  use Ecto.Migration

  def change do
    create table(:appointments, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :date, :utc_datetime

      add :provider_id, references(:users, type: :binary_id)

      timestamps()
    end
  end
end
