defmodule InfotechCalendarWeb.UserDashboardLive do
    use InfotechCalendarWeb, :live_view
  
    def render(assigns) do
        ~H"""
        <div class="mx-auto max-w-sm bg-white p-4 rounded-md">
        Dashboard
        </div>
        """
    end
end