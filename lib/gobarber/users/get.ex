defmodule Gobarber.Users.Get do
  alias Gobarber.{Repo, User}

  def by_id(id) do
    Repo.get(User, id)
  end
end
