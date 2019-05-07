defmodule ShiftManage.ShiftController do
    use ShiftManage.Web, :controller
    alias ShiftManage.Shift
    alias ShiftManage.Time

    def index_shifts(conn, %{"id" => id}) do
        shifts = Repo.all(Shift)
        render conn, "index.html", shifts: shifts
    end

    def new_shifts(conn, %{"id" => id}) do
       changeset = Shift.changeset(%Shift{})
       render conn, "new.html", changeset: changeset, id: id
    end
end