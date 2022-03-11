defmodule Gobarber.Users.Create do
  alias Gobarber.{User, Repo}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{} = result}), do: {:ok, result}
  defp handle_insert({:error, result}), do: {:error, result}
end
