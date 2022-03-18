defmodule Gobarber.Auth.Session do
  alias Gobarber.{Repo, User}

  def authenticate(email, password) do
    case Repo.get_by(User, email: email) do
      nil ->
        {:error, :not_found}

      user ->
        validate_password(password, user)
    end
  end

  defp validate_password(password, user) do
    case Bcrypt.verify_pass(password, user.password_hash) do
      true -> {:ok, user}
      false -> {:error, :unauthorized}
    end
  end
end
