class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_one :user, dependent: :nullify


  def add_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  def total_of_product(product_id)
    total = 0
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      line_items.each do |item|
        if item.product.id == product_id
          total += item.product.price
        end
      end
    end
    total * current_item.quantity
  end

  def total_summ
    total = 0
    line_items.each do |item|
        total += item.product.price * item.quantity
    end
    total
  end
  end