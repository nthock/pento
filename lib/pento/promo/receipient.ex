defmodule Pento.Promo.Recipient do
  defstruct [:first_name, :email]
  @types %{first_name: :string, email: :string}

  import Ecto.Changeset

  def changeset(%__MODULE__{} = user, attrs) do
    {user, @types}
    |> cast(attrs, Map.keys(@types))
    |> validate_required([:first_name, :email])
    |> validate_format(:email, ~r/@/)
  end

  def new(attrs) do
    %__MODULE__{}
    |> struct(%{})
    |> changeset(attrs)
    |> apply_action(:new)
  end
end
