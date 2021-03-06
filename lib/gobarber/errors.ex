defmodule Gobarber.Error do
  @keys [:status, :result]
  @enforce_keys @keys

  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def build_not_found_user_error, do: build(:not_found, "User not found!.")
end
