class ProductUpload
  def initialize(file)
    @file = file
  end

  def parse!
    unknowns = []
    products_attributes = SmarterCSV.process(@file)
    products_attributes.each do |product_attributes|
      throwaways = [:name, :description, :price]
      unknown_attributes = product_attributes.reject { |k, v| throwaways.include? k }
      unknowns << unknown_attributes
      product_attributes.reject! { |k, v| !throwaways.include? k }
      Product.create(product_attributes)
    end
    unknowns
  end
end
