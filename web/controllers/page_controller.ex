defmodule ShiftManage.PageController do
  use ShiftManage.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
