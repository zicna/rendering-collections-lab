class StoreAdminController < ApplicationController
  layout 'admin'
  def home
  end

  def orders
    @orders = Order.all
  end

  def invoice
    
  end

  def invoices
    @invoices = Invoice.all
  end
end
