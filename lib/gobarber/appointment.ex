defmodule Gobarber.Appointment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:provider, :date]

  @derive {Jason.Encoder, only: [:provider, :date]}

  schema "appointments" do
    field :provider, :string
    field :date, :utc_datetime

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
