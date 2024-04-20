module PostsHelper

    def month_day(datetime)
        datetime.strftime("%B %e, %Y")    
    end
end
