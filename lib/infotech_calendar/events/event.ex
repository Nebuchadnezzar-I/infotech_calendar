defmodule InfotechCalendar.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :name, :string
    field :type, :string
    field :date, :date
    field :description, :string
    field :location, :string
    field :action_type, :string
    field :is_repeating, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:type, :action_type, :name, :date, :is_repeating, :description, :location])
    |> validate_required([:type, :name, :date, :is_repeating])
  end
end
