defmodule ShiftManage.Time do
    use ShiftManage.Web, :model
    use Timex

    def get_date() do
        utc_now = Date.utc_today
    end

    def get_next_month(now) do # 次の月の1日を返す
        number = Date.days_in_month(now)
        next = number - now.day + 1
        Date.add(now, next)
    end

    def get_now_month(now) do # 次の月の1日を返す
        number = Date.days_in_month(now)
        number = 0-(now.day - 1)
        Date.add(now, number)
    end

    def get_pre_month(now) do # 前の月の1日を返す
        number = 0 - now.day
        pre = Date.add(now, number)
        # 前の月の最終日になる
        number = Date.days_in_month(pre)
        pre_number = 0 - (number - 1)
        Date.add(pre, pre_number) 
    end 

    def get_week(date) do  
        week_now = Date.day_of_week date
        case {week_now} do  
        {1} -> "月"
        {2} -> "火"
        {3} -> "水"
        {4} -> "木"
        {5} -> "金"
        {6} -> "土"
        {7} -> "日"
        end
    end

    def get_month(now,month) do
        case {month} do
          {"pre"} -> get_pre_month(now)
          {"now"} -> get_now_month(now)
          {"next"} -> get_next_month(now)
        end
    end
end
