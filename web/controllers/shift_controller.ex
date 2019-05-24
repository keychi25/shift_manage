defmodule ShiftManage.ShiftController do
  use ShiftManage.Web, :controller
  alias ShiftManage.Shift
  alias ShiftManage.Time

  def index_shifts(conn, %{"id" => id, "now" => now, "before_or_after" => before_or_after}) do
    shifts = Repo.all(Shift)
    render(conn, "index_shifts.html", shifts: shifts)
  end

  def new(conn, %{"id" => id}) do
    utc_now = Time.get_date()
    next_month = Time.get_next_month(utc_now)
    pre_month = Time.get_pre_month(utc_now)
    changeset = Shift.changeset(%Shift{})

    render(conn, "new.html",
      id: id,
      changeset: changeset,
      now: utc_now,
      next: next_month,
      pre: pre_month
    )
  end

  def new_shifts(conn, %{"id" => id, "before_or_after" => before_or_after, "month" => month}) do
    now = Time.get_date()
    get_month = Time.get_month(now, month)
    # changesets = Shift.create_changesets(before_or_after, get_month)
    changeset = Shift.changeset(%Shift{})

    render(conn, "new_shifts.html",
      changeset: changeset,
      id: id,
      now: get_month,
      before_or_after: before_or_after
    )
  end

  def create(conn, %{"shift" => shift_params}) do
    changeset = Shift.changeset(%Shift{}, shift_params)

    case Repo.insert(changeset) do
      {:ok, shifts} ->
        conn
        |> put_flash(:info, "作成しました")
        |> redirect(to: page_path(conn, :index))

      {:error, changeset} ->
        render(conn, "new_shifts_kari.html", changeset: changeset)
    end
  end

  def new_shifts_kari(conn, %{"id" => id}) do
    changeset = Shift.changeset(%Shift{})
    render(conn, "new_shifts_kari.html", changeset: changeset)
  end

  def create_kari(conn, %{"shift" => shift_params}) do
    changeset = Shift.changeset(%Shift{}, shift_params)

    case Repo.insert(changeset) do
      {:ok, shift} ->
        conn
        |> put_flash(:info, "作成しました")
        |> redirect(to: page_path(conn, :index))

      {:error, changeset} ->
        render(conn, "new_shifts_kari.html", changeset: changeset)
    end
  end

  def create_chagesets() do
    changeset = Shift.changeset(%Shift{})
  end
end
