defmodule Gobarber.Users.Create do
  alias Gobarber.{Error, User, Repo}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{} = result}), do: {:ok, result}

  defp handle_insert({:error, reason}) do
    {:error, Error.build(:bad_request, reason)}
  end
end
