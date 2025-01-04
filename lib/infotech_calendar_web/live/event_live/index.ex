defmodule InfotechCalendarWeb.EventLive.Index do
  use InfotechCalendarWeb, :live_view

  require Logger

  alias InfotechCalendar.Events
  alias InfotechCalendar.Events.Event

  @impl true
  def mount(_params, _session, socket) do
    events = Events.list_events() || []
    event_types = Events.list_event_types() || []

    {:ok,
     socket
     |> assign(:events, events)
     |> assign(:event_types, event_types)
     |> assign(:query, "")}
  end

  @impl true
  def handle_event("search", %{"value" => query}, socket) do
    filtered_events =
      Events.list_events()
      |> Enum.filter(fn event ->
        query == "" || String.contains?(String.downcase(event.name || ""), String.downcase(query))
      end)

    {:noreply,
     socket
     |> assign(:query, query)
     |> assign(:events, filtered_events)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Event")
    |> assign(:event, Events.get_event!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Event")
    |> assign(:event, %Event{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Events")
    |> assign(:event, nil)
  end

  @impl true
  def handle_info({InfotechCalendarWeb.EventLive.FormComponent, {:saved, event}}, socket) do
    {:noreply, stream_insert(socket, :events, event)}
  end
end
