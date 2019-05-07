defmodule ShiftManage.ShiftController do
    use ShiftManage.Web, :controller
    alias ShiftManage.Shift
    alias ShiftManage.Time

    def index_shifts(conn, %{"id" => id}) do
        shifts = Repo.all(Shift)
        render conn, "index.html", shifts: shifts
    end

    def new(conn, _no_params) do
        utc_now = Time.get_date()
        previous_month = Time.get_previous_month(utc_now)
        next_month = Time.get_next_month(utc_now)
        changeset = Shift.changeset(%Shift{})
        render conn, "new.html", changeset: changeset, month: utc_now, next_month: next_month, previous_month: previous_month
    end    

    def new_shifts(conn, %{"id" => id}) do
       changeset = Shift.changeset(%Shift{})
       render conn, "new_shifts.html", changeset: changeset, id: id
    end

end