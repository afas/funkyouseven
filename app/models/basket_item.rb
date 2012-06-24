class BasketItem
  attr_reader :product, :product_count, :product_size

  def initialize(product, size_id)
    @product = product
    @product_size = size_id
    @product_count = 1
  end

  def increment_count
    @product_count += 1
  end

  def set_count(product_count)
    @product_count = product_count.to_i
  end

  def preview_url
    @product.get_preview.image.url(:preview_item)
  end

  def title
    @product.title
  end

  def price
    @product.price
  end

  def sum
    @product.price * @product_count
  end

end