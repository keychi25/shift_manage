defmodule ShiftManage.Repo.Migrations.CreateShift do
  use Ecto.Migration

  def change do
    create table(:shifts) do
      
      add :day, :date
      add :start_time, :datetime
      add :finish_time, :datetime
      add :free, :boolean
      add :week, :string
      add :user_id, :string
      timestamps()
    end
  end
end
