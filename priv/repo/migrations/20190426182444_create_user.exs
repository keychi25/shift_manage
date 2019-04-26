defmodule ShiftManage.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :user_id, :integer
      add :name, :string
      add :email, :string, null: false
      add :password_hash, :string
      add :role, :string
 
      timestamps()
    end
 
    create unique_index(:users, [:email, :user_id])
  end
end
