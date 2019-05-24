defmodule ShiftManage.Shift do
  use ShiftManage.Web, :model
  alias ShiftManage.ShiftController

  schema "shifts" do
    field(:day, :date)
    field(:start_time, :time)
    field(:finish_time, :time) 
    field(:free, :boolean)
    field(:week, :string) 
    field(:user_id, :string) 
    timestamps()
  end

  @required_fields ~w(day start_time finish_time free week user_id)
  @optional_fields ~w()

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def create_changesets(b_or_a, month) do
    number = Date.days_in_month(month)

    if b_or_a == "before" do
      number = 15
    else
      number = number - 15
    end

    for i <- 0..number do
      changesets = [ShiftController.create_chagesets()]
    end
  end
end
