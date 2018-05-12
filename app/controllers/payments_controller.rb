class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @payment = Payment.new
    @payments = Payment.order('ends_at ASC').page(params[:page]).per(5)
  end

  def create

    if Payment.all.present?
      @last_payment = Payment.last.ends_at

      if @last_payment.day < 15
        @payment = Payment.new(starts_at: @last_payment.next_day,
                               ends_at: @last_payment + 15.day,
                               user_id: current_user.id)
      else
        @payment = Payment.new(starts_at: @last_payment.next_day,
                               ends_at: @last_payment.next_month - 15.day,
                               user_id: current_user.id)
      end
    else
      @payment = Payment.new(starts_at: Date.new(2016, 01, 5),
                             ends_at: Date.new(2016, 01, 19),
                             user_id: current_user.id)
    end

    if @payment.save
      redirect_to payments_path
    else
      render :new
    end
  end

  def destroy
    @payment = Payment.find(params[:id])

    @payment.destroy
    redirect_to payments_path
  end
end

