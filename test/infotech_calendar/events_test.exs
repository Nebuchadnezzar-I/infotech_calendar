defmodule InfotechCalendar.EventsTest do
  use InfotechCalendar.DataCase

  alias InfotechCalendar.Events

  describe "events" do
    alias InfotechCalendar.Events.Event

    import InfotechCalendar.EventsFixtures

    @invalid_attrs %{name: nil, type: nil, date: nil, description: nil, location: nil, action_type: nil, is_repeating: nil}

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Events.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Events.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      valid_attrs = %{name: "some name", type: "some type", date: ~D[2025-01-01], description: "some description", location: "some location", action_type: "some action_type", is_repeating: true}

      assert {:ok, %Event{} = event} = Events.create_event(valid_attrs)
      assert event.name == "some name"
      assert event.type == "some type"
      assert event.date == ~D[2025-01-01]
      assert event.description == "some description"
      assert event.location == "some location"
      assert event.action_type == "some action_type"
      assert event.is_repeating == true
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      update_attrs = %{name: "some updated name", type: "some updated type", date: ~D[2025-01-02], description: "some updated description", location: "some updated location", action_type: "some updated action_type", is_repeating: false}

      assert {:ok, %Event{} = event} = Events.update_event(event, update_attrs)
      assert event.name == "some updated name"
      assert event.type == "some updated type"
      assert event.date == ~D[2025-01-02]
      assert event.description == "some updated description"
      assert event.location == "some updated location"
      assert event.action_type == "some updated action_type"
      assert event.is_repeating == false
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_event(event, @invalid_attrs)
      assert event == Events.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Events.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Events.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Events.change_event(event)
    end
  end
end
