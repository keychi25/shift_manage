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

    def get_previous_month(utc_now) do
        try do
            for i <- 1..31 do 
                if( utc_now.month != Date.add(utc_now, i).month ) do
                next_month = Date.add(utc_now, i)
                throw utc_now.month
                else
                IO.puts "次の日にする"
               end
            end 
        catch 
            found -> found
        end
    end

    def get_next_month(utc_now) do
        try do
            for i <- 1..31 do 
                if(utc_now.month != Date.add(utc_now, -i).month) do
                previous_month = Date.add(utc_now, -i)
                throw utc_now.month
                else
                IO.puts "前の日にする"
                end 
            end
        catch
            found -> found
        end
    end

    def get_fifteen_days(month, berfore_or_after) do
        
    end

end