defmodule InfotechCalendar.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :type, :string
      add :action_type, :string
      add :name, :string
      add :date, :date
      add :is_repeating, :boolean, default: false, null: false
      add :description, :text
      add :location, :string

      timestamps(type: :utc_datetime)
    end
  end
end
