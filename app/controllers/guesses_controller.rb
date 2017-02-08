class GuessesController < ApplicationController

  def index

    @data = Guess.all

    render("index.html.erb")
  end

  def details

    id = params["id"]

    g = Guess.find(id)

    @num1 = g.first_number
    @num2 = g.second_number
    @num3 = g.third_number

    if @num1 == nil || @num2 == nil || @num3 == nil
      @obey_rule = "No"
    elsif @num1 < @num2 && @num2 < @num3
      @obey_rule = "Yes"
    else
      @obey_rule = "No"
    end

    render ("details.html.erb")

  end

  def new_form



    render("new_form.html.erb")

  end

  def create_row

    g = Guess.new

    g.first_number, g.second_number, g.third_number = params[:first_number].to_i, params[:second_number].to_i, params[:third_number].to_i

    g.save

    @num1 = g.first_number
    @num2 = g.second_number
    @num3 = g.third_number

    # redirect_to("localhost:3000/guesses")
    render("create_guess.html.erb")

  end

  def edit_guess

    old_id = params["old_id"]

    @g = Guess.find(old_id)

    @num1 = @g.first_number
    @num2 = @g.second_number
    @num3 = @g.third_number

    render("edit_guess.html.erb")
  end

end
