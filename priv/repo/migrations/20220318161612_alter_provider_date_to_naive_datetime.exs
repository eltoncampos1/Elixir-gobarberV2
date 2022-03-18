defmodule Gobarber.Repo.Migrations.AlterProviderDateToNaiveDatetime do
  use Ecto.Migration

  def change do
    alter table(:appointments) do
      modify :date, :naive_datetime
    end
  end
end
