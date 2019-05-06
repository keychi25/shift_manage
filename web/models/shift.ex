defmodule ShiftManage.Shift do
    use ShiftManage.Web, :model
 
  schema "shift" do
    field :day, :date
    field :start_time, :naive_datetime
    field :finish_times, :naive_datetime
    field :free, :boolean
    field :week, :string
    field :user_id, :string
  end
 
  @required_fields ~w(day start_time finish_time free week user_id)
  @optional_fields ~w()

    def changeset(model, params \\ %{}) do
      model
      |> cast(params, @required_fields, @optional_fields)
      |> validate_required(:name)
      |> validate_length(:name, min: 1, max: 20)
    end
end