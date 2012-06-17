class BasketItem
  attr_reader :product, :count, :size

  def initialize(product, size)
    @product = product
    @size = size
    @count = 1
  end

  def increment_count
    @count += 1
  end

  def decrement_count
    @count -= 1
  end

  def title
    @product.name
  end

  def price
    @product.price * @count
  end

end