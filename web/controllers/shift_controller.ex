defmodule ShiftManage.ShiftController do

    use ShiftManage.Web, :controller
    alias ShiftManage.Shift
    alias ShiftManage.Time

    def index_shifts(conn, %{"id" => id}) do
        shifts = Repo.all(Shift)
        render conn, "index.html", shifts: shifts
    end

    def new(conn, %{"id" => id}) do
        utc_now = Time.get_date()
        changeset = Shift.changeset(%Shift{})
        render conn, "new.html", id: id, changeset: changeset, month: utc_now
    end    

    def new_shifts(conn, %{"id" => id}, :number)do
       changeset = Shift.changeset(%Shift{})
       render conn, "new_shifts.html", changeset: changeset, id: id
    end

end