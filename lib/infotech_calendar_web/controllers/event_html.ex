defmodule InfotechCalendarWeb.EventHTML do
  use InfotechCalendarWeb, :html

  embed_templates "event_html/*"

  @doc """
  Renders a event form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def event_form(assigns)
end
