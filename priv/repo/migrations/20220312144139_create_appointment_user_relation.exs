defmodule Gobarber.Repo.Migrations.CreateAppointmentUserRelation do
  use Ecto.Migration

  def change do
    alter table(:appointments) do
      add :provider_id, references(:users, type: :binary_id)
    end
  end
end
