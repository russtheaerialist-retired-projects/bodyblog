class ChartsController < ApplicationController

    def index
    end

    def sleep
        @data = Blog.last_n_sleep_entries(100)

        respond_to do |format|
            format.png { generate_sparkbar("bar", 8.0, :bottom_bad) }
            format.html
        end
    end

    def calories_in
        @data = Blog.last_n_calories_eaten_entries(100)
        respond_to do |format|
            format.png { generate_sparkbar("bar", 2300, :bottom_good) }
            format.html
        end
    end

    def calories_out
        @data = Blog.last_n_calories_burned_entries(100)
        respond_to do |format|
            format.png { generate_sparkbar("bar", 2300, :bottom_bad) }
            format.html
        end
    end

    def calories_difference
        @data = Blog.last_n_calories_difference_entries(100)
        respond_to do |format|
            format.png { generate_sparkbar("bar", 0, :bottom_good) }
            format.html
        end
    end

    def chest
        @data = Blog.last_n_chest_entries(100)
        respond_to do |format|
            format.png { generate_sparkbar("bar", 40, :bottom_good) }
            format.html
        end
    end

    def waist
        @data = Blog.last_n_waist_entries(100)
        respond_to do |format|
            format.png { generate_sparkbar("bar", 30, :bottom_good) }
            format.html
        end
    end

    def hips
        @data = Blog.last_n_hips_entries(100)
        respond_to do |format|
            format.png { generate_sparkbar("bar", 0, :bottom_bad) }
            format.html
        end
    end

    def weight
        @data = Blog.last_n_weight_entries(100)
        respond_to do |format|
            format.png { generate_sparkbar("bar", 145.0, :bottom_good) }
            format.html
        end
    end

    def bodyfat
        @data = Blog.last_n_bodyfat_entries(100)
        respond_to do |format|
            format.png { generate_sparkbar("bar", 12.0, :bottom_good) }
            format.html
        end
    end

    private

    def generate_sparkbar(type, upper, colorize)
        if (@data.count < 1)
            @data = [ 0 ]
        end
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
