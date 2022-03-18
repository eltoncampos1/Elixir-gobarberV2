defmodule Gobarber.Users.UserAvatar do
  use Waffle.Definition
  use Waffle.Ecto.Definition
  alias Gobarber.User

  @versions [:original, :thumb]
  @extension_whitelist ~w(.jpg .jpeg .gif .png)

  def update_user_avatar(%User{} = user, params) do
    user
    |> User.avatar_changeset(params)
    |> Repo.update()
  end

  def changse_user_avatar(%User{} = user) do
    User.avatar_changeset(user, %{})
  end

  def save({%Plug.Upload{}, scope} = path) do
    path
    |> IO.inspect()
  end

  def validate({file, _}) do
    IO.inspect(file)
    file_extension = file.file_name |> Path.extname() |> String.downcase()

    case Enum.member?(@extension_whitelist, file_extension) do
      true -> :ok
      false -> {:error, "file type is invalid"}
    end
  end

  def storage_dir(_, {file, user}) do
    "uploads/avatars/#{user.id}"
  end
end
