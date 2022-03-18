defmodule Gobarber.User do
  use Ecto.Schema
  use Waffle.Ecto.Schema
  import Ecto.Changeset
  alias Gobarber.Users.UserAvatar

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:name, :email, :password, :cpf]

  @derive {Jason.Encoder, only: [:name, :email, :cpf, :id]}

  schema "users" do
    field :name, :string
    field :email, :string
    field :cpf, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :avatar_url, UserAvatar.Type
    has_many :appointments, Gobarber.Appointment

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6)
    |> validate_length(:cpf, is: 11)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
    |> put_password_hash()
  end

  def avatar_changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [])
    |> cast_attachments(params, [:avatar_url])
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, Bcrypt.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
