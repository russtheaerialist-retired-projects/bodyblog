class ChartsController < ApplicationController

    def index
    end

    def sleep
        @data = Blog.last_n_sleep_entries(100)

        respond_to do |format|
            format.png { generate_sparkline("bar", 8.0, :bottom_bad) }
            format.html
        end
    end

    def calories_in
        @data = Blog.last_n_calories_eaten_entries(100)
        respond_to do |format|
            format.png { generate_sparkline("bar", 2300, :bottom_good) }
            format.html
        end
    end

    def calories_out
        @data = Blog.last_n_calories_burned_entries(100)
        respond_to do |format|
            format.png { generate_sparkline("bar", 2300, :bottom_bad) }
            format.html
        end
    end

    def calories_difference
        @data = Blog.last_n_calories_difference_entries(100)
        respond_to do |format|
            format.png { generate_sparkline("bar", 0, :bottom_good) }
            format.html
        end
    end

    private

    def generate_sparkline(type, upper, colorize)
        above_color = "#006600"
        below_color = "#ff6600"
        if (colorize == :bottom_good)
            tmp = above_color
            above_color = below_color
            below_color = tmp
        end
            
        send_data(Sparklines.plot(@data, :type=>type, :height=>15, :background_color=>"#CCCCCC",
             :upper=>upper, :above_color=>above_color, :below_color=>below_color), :type=>'image/png', :disposition=>'inline')
    end
end
