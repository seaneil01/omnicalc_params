class CalculationsController < ApplicationController
  def flex_square_num
    # Parameters: {"num"=>"5"}
    @user_number = params["num"].to_f
    @square = @user_number **2
    render("calculations/flex_square_num.html.erb")
  end

  def flex_square_root_num
    @user_number = params["num"].to_f
    @square_root = Math.sqrt(@user_number)
    render("calculations/flex_square_root_num.html.erb")
  end

  def flex_payment
    @apr = (params[:basis_points].to_f/100)
    @years = params[:number_of_years].to_i
    @principal = params[:present_value].to_f

    monthly_apr = @apr/12/100
    months = @years * 12

    @monthly_payment = (monthly_apr*@principal)/(1-(1+monthly_apr)**(-months))
    render("calculations/flex_payment.html.erb")
  end

  def flex_random
    @user_min = params["min"].to_f
    @user_max = params["max"].to_f
    @rand = rand(@user_min..@user_max).to_i

    render("calculations/flex_random.html.erb")
  end



  # START FORMS

  def square_form
    render("calculations/square_form.html.erb")
  end

  def square
    @user_number = params[:user_number].to_f
    @square = @user_number **2
    render("calculations/square.html.erb")
  end

  def square_root_form
    render("calculations/square_root_form.html.erb")
  end

  def square_root
    @user_number = params[:user_number].to_f
    @square_root = Math.sqrt(@user_number)
    render("calculations/square_root.html.erb")
  end

  def payment_form
    render("calculations/payment_form.html.erb")
  end

  def payment_results
    @apr = params[:user_apr].to_f
    @years = params[:user_years].to_i
    @principal = params[:user_prin].to_f

    monthly_apr = @apr/12/100
    months = @years * 12

    @monthly_payment = (monthly_apr*@principal)/(1-(1+monthly_apr)**(-months))
    render("calculations/payment_results.html.erb")
  end

  def random_form
    render("calculations/random_form.html.erb")
  end

  def random_results
    @user_min = params[:user_min].to_f
    @user_max = params[:user_max].to_f
    @rand = rand(@user_min..@user_max)
    render("calculations/random_results.html.erb")
  end
end
