defmodule Gobarber.Repo.Migrations.CreateAppointmentsTable do
  use Ecto.Migration

  def change do
    create table(:appointments, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :provider, :string
      add :date, :utc_datetime

      timestamps()
    end
  end
end
