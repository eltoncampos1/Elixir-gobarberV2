defmodule Gobarber.Appointment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:provider, :date]

  @derive {Jason.Encoder, only: [:provider, :date]}

  schema "appointments" do
    field :date, :utc_datetime
    belongs_to :user, Gobarber.User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
