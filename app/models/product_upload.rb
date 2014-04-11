class ProductUpload
  def initialize(file)
    @file = file
  end

  def parse!
    products_attributes = SmarterCSV.process(@file)
    products_attributes.each do |product_attributes|
      Product.create(product_attributes)
    end
  end
end
