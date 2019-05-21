defmodule ShiftManage.Time do
    use ShiftManage.Web, :model

    def get_date() do
        utc_now = Date.utc_today
    end

    def get_week(date) do
        week_now = Date.day_of_week date
        case {week_now} do
        {0} -> "日"
        {1} -> "月"
        {2} -> "火"
        {3} -> "水"
        {4} -> "木"
        {5} -> "金"
        {6} -> "土"
        end
    end

end
