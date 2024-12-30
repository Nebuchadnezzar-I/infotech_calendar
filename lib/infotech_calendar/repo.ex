defmodule InfotechCalendar.Repo do
  use Ecto.Repo,
    otp_app: :infotech_calendar,
    adapter: Ecto.Adapters.SQLite3
end
