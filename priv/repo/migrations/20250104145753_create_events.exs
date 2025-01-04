defmodule InfotechCalendar.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :type, :string
      add :action_type, :string, null: true
      add :name, :string, null: true
      add :date, :date
      add :is_repeating, :boolean, default: false, null: false
      add :description, :text, null: true
      add :location, :string, null: true

      timestamps(type: :utc_datetime)
    end
  end
end
