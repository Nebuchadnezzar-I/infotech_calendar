defmodule InfotechCalendarWeb.PageController do
  use InfotechCalendarWeb, :controller
  alias InfotechCalendar.Events

  def home(conn, _params) do
    case validate_cookie(conn, "user_session") do
      {:error, _decrypted_value} ->
        conn
        |> put_flash(:error, "You are not logged in.")
        |> render(:home, layout: false)

      {:ok, _reason} ->
        conn
        |> redirect(to: "/dashboard")
    end
  end

  def calendar(conn, _params) do
    render(conn, :calendar, layout: false)
  end

  def dashboard(conn, params) do
    query = Map.get(params, "query", nil)
    selected_types = Map.get(params, "types", "") |> String.split(",", trim: true)

    events =
      Events.list_events()
      |> Enum.filter(fn event ->
        matches_query?(event, query) and matches_type?(event, selected_types)
      end)

    unique_types = Events.get_unique_event_types()

    case validate_cookie(conn, "user_session") do
      {:ok, _decrypted_value} ->
        conn
        |> render(:dashboard, layout: false, events: events, query: query, types: unique_types, selected_types: selected_types)

      {:error, _reason} ->
        conn
        |> redirect(to: "/")
    end
  end

  def not_found(conn, _params) do
    render(conn, :not_found, layout: false)
  end

  # Handlers

  defp matches_query?(event, nil), do: true
  defp matches_query?(event, query), do: String.contains?(String.downcase(event.name), String.downcase(query))

  defp matches_type?(_event, []), do: true
  defp matches_type?(event, selected_types), do: event.type in selected_types

  def login_otp(conn, %{"login-otp" => otp_value}) do
    if otp_value == "000000" do
      conn
      |> put_resp_cookie("user_session", generate_cookie_key(otp_value), max_age: 3600)
      |> put_flash(:info, "Login was successful")
      |> redirect(to: "/dashboard")
    else
      conn
      |> put_flash(:error, "Login was unsuccessful")
      |> redirect(to: "/")
    end
  end

  defp generate_cookie_key(data) do
    secret = Application.get_env(:your_app, :cookie_secret, "your-very-secret-key")
    signing_key = Plug.Crypto.KeyGenerator.generate(secret, "signing")
    encryption_key = Plug.Crypto.KeyGenerator.generate(secret, "encryption")

    Plug.Crypto.MessageEncryptor.encrypt(data, encryption_key, signing_key)
  end

  def validate_cookie(conn, _cookie_key) do
    secret = Application.get_env(:your_app, :cookie_secret, "your-very-secret-key")
    signing_key = Plug.Crypto.KeyGenerator.generate(secret, "signing")
    encryption_key = Plug.Crypto.KeyGenerator.generate(secret, "encryption")

    case conn.req_cookies["user_session"] do
      nil ->
        {:error, "Cookie not found"}

      encrypted_value ->
        case Plug.Crypto.MessageEncryptor.decrypt(encrypted_value, encryption_key, signing_key) do
          {:ok, decrypted_value} ->
            {:ok, decrypted_value}

          :error ->
            {:error, "Invalid or tampered cookie"}
        end
    end
  end
end
