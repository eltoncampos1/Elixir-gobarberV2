defmodule GobarberWeb.Auth.Guardian do
  use Guardian, otp_app: :gobarber

  alias Gobarber.Users
  alias Gobarber.Auth.Session

  def subject_for_token(user, _claims) do
    {:ok, to_string(user.id)}
  end

  def resource_from_claims(claims) do
    user =
      claims["sub"]
      |> User.Get.call()

    {:ok, user}
  end

  def authenticate(email, password) do
    case Session.authenticate(email, password) do
      {:ok, user} -> create_token(user)
      _ -> {:error, :unauthenticated}
    end
  end

  defp create_token(user) do
    {:ok, token, _claim} = encode_and_sign(user)
    {:ok, user, token}
  end
end
