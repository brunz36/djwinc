class ChargesController < ApplicationController
  def new
    @order = Order.last
  end

  def create
    # Figure out what order this is for
    @order = Order.find(params[:order_id])

    # Get the amount from that
    @amount = @order.total_cents

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: '???????????',
      currency: 'usd'
    )

    # Toggle any booleans needed on items in that order
    @order.items.update_all(in_stock: false)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
