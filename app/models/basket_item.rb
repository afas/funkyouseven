class BasketItem
  attr_reader :product, :product_count, :product_size, :initial_size

  def initialize(product, size_id)
    @product = product
    @product_size = size_id.to_i
    @initial_size = size_id.to_i
    @product_count = 1
  end

  def increment_count
    @product_count += 1
  end

  def set_count(product_count)
    @product_count = product_count.to_i
  end

  def set_size(size_id)
    @product_size = size_id
  end

  def preview_url
    @product.get_preview.image.url(:preview_item)
  end

  def initial_size
    @initial_size
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

  def all_sizes
    Product.all_sizes(@product.id)
  end
end