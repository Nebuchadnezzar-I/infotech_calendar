defmodule InfotechCalendarWeb.EventLiveTest do
  use InfotechCalendarWeb.ConnCase

  import Phoenix.LiveViewTest
  import InfotechCalendar.EventsFixtures

  @create_attrs %{
    name: "some name",
    type: "some type",
    date: "2025-01-03",
    description: "some description",
    location: "some location",
    action_type: "some action_type",
    is_repeating: true
  }
  @update_attrs %{
    name: "some updated name",
    type: "some updated type",
    date: "2025-01-04",
    description: "some updated description",
    location: "some updated location",
    action_type: "some updated action_type",
    is_repeating: false
  }
  @invalid_attrs %{
    name: nil,
    type: nil,
    date: nil,
    description: nil,
    location: nil,
    action_type: nil,
    is_repeating: false
  }

  defp create_event(_) do
    event = event_fixture()
    %{event: event}
  end

  describe "Index" do
    setup [:create_event]

    test "lists all events", %{conn: conn, event: event} do
      {:ok, _index_live, html} = live(conn, ~p"/events")

      assert html =~ "Listing Events"
      assert html =~ event.name
    end

    test "saves new event", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/events")

      assert index_live |> element("a", "New Event") |> render_click() =~
               "New Event"

      assert_patch(index_live, ~p"/events/new")

      assert index_live
             |> form("#event-form", event: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#event-form", event: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/events")

      html = render(index_live)
      assert html =~ "Event created successfully"
      assert html =~ "some name"
    end

    test "updates event in listing", %{conn: conn, event: event} do
      {:ok, index_live, _html} = live(conn, ~p"/events")

      assert index_live |> element("#events-#{event.id} a", "Edit") |> render_click() =~
               "Edit Event"

      assert_patch(index_live, ~p"/events/#{event}/edit")

      assert index_live
             |> form("#event-form", event: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#event-form", event: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/events")

      html = render(index_live)
      assert html =~ "Event updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes event in listing", %{conn: conn, event: event} do
      {:ok, index_live, _html} = live(conn, ~p"/events")

      assert index_live |> element("#events-#{event.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#events-#{event.id}")
    end
  end

  describe "Show" do
    setup [:create_event]

    test "displays event", %{conn: conn, event: event} do
      {:ok, _show_live, html} = live(conn, ~p"/events/#{event}")

      assert html =~ "Show Event"
      assert html =~ event.name
    end

    test "updates event within modal", %{conn: conn, event: event} do
      {:ok, show_live, _html} = live(conn, ~p"/events/#{event}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Event"

      assert_patch(show_live, ~p"/events/#{event}/show/edit")

      assert show_live
             |> form("#event-form", event: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#event-form", event: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/events/#{event}")

      html = render(show_live)
      assert html =~ "Event updated successfully"
      assert html =~ "some updated name"
    end
  end
end