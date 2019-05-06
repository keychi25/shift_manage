defmodule ShiftManage.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :user_id, :string
      add :name, :string
      add :password_hash, :string
      add :role, :string
      add :open_counter, :boolean
      add :open_round, :boolean
      add :close_counter, :boolean
      add :close_round, :boolean
      add :daily_delivered, :boolean
      add :constant_delivered, :boolean
      timestamps()
    end
  end
end