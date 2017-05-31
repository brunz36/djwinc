class ChargesController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
  end

  def create
    @order = Order.find(params[:order_id])

    @amount = @order.total_cents

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Dinos Jewelry',
      currency: 'usd'
    )

    OrderMailer.received(@order).deliver_later
    @order.items.update_all(in_stock: false)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
