defmodule InfotechCalendarWeb.CalendarLive.Index do
  use InfotechCalendarWeb, :live_view

  alias InfotechCalendar.Events

  def mount(_params, _session, socket) do
    {:ok, stream(socket, :events, Events.list_events())}
  end
end
