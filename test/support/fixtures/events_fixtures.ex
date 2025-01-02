defmodule InfotechCalendar.EventsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `InfotechCalendar.Events` context.
  """

  @doc """
  Generate a event.
  """
  def event_fixture(attrs \\ %{}) do
    {:ok, event} =
      attrs
      |> Enum.into(%{
        action_type: "some action_type",
        date: ~D[2025-01-01],
        description: "some description",
        is_repeating: true,
        location: "some location",
        name: "some name",
        type: "some type"
      })
      |> InfotechCalendar.Events.create_event()

    event
  end
end
