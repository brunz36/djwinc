class OrderMailer < ApplicationMailer
  default from: 'Bruno Ribeiro <bruno@dinosjewelry.com>'

  def received(order)
    @order = order

    mail to: order.email, subject: "Dino's Jewelry Order Confirmation"
  end

  def shipped(order)
    @order = order

    mail to: order.email, subject: "Dino's Jewelry Shipping Confirmation"
  end
end
