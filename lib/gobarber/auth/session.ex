defmodule Gobarber.Auth.Session do
  alias Gobarber.{Repo, User}

  def authenticate(email, password) do
    case Repo.get_by(User, email: email) do
      nil ->
        {:error, :not_found}

      user ->
        if Bcrypt.verify_pass(password, user.password_hash) do
          {:ok, user}
        else
          {:error, :unauthorized}
        end
    end
  end
end
