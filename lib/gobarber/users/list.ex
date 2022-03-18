defmodule Gobarber.Users.List do
  alias Gobarber.{Repo, User}

  def call() do
    Repo.all(User)
  end
end
