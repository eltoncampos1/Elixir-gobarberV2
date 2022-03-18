defmodule Gobarber.Repo.Migrations.AddAvatarUrlFieldToUserTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :avatar_url, :string
    end
  end
end
