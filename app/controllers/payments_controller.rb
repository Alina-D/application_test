class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @payments = Payment.all
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def create
    @payment = current_user.payment.new()

    if @payment.save
      redirect_to @payments
    else
      redirect_to search_path
    end
  end
end
