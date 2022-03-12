defmodule Gobarber.Appointment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:provider_id, :date]

  @derive {Jason.Encoder, only: [:user, :date]}

  schema "appointments" do
    field :date, :utc_datetime

    belongs_to :user, Gobarber.User, foreign_key: :provider_id

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
