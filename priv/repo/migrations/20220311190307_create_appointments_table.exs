defmodule Gobarber.Repo.Migrations.CreateAppointmentsTable do
  use Ecto.Migration

  def change do
    create table(:appointments) do
      add :provider, :string
      add :date, :utc_datetime

      timestamps()
    end
  end
end
