defmodule ShiftManage.User do
    use ShiftManage.Web, :model
 
  schema "users" do
    field :user_id, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :role, :string
    field :open_counter, :boolean
    field :open_round, :boolean
    field :close_counter, :boolean
    field :close_round, :boolean
    field :daily_delivered, :boolean
    field :constant_delivered, :boolean
 
    timestamps()
  end
 
  @required_fields ~w(user_id name role open_counter open_round close_counter close_round daily_delivered constant_delivered)
  @optional_fields ~w()

    def changeset(model, params \\ %{}) do
      model
      |> cast(params, @required_fields, @optional_fields)
      |> validate_required(:user_id)
      |> validate_length(:user_id, min: 10, max: 10)
      |> validate_required(:name)
      |> validate_length(:name, min: 1, max: 20)
    end

    def registration_changeset(model, params) do
      model
      |> changeset(params)
      |> cast(params, ~w(password), [])
      |> validate_required(:password)
      |> validate_length(:password, min: 6, max: 100)
      |> put_pass_hash()
    end
     
    defp put_pass_hash(changeset) do
       case changeset do
        %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
          put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
          _ ->
          changeset
       end
    end
end
