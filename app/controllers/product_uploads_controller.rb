class ProductUploadsController < ApplicationController

  def new
  end

  def create
    before = Product.all.count
    @product_upload = ProductUpload.new(params[:file].tempfile).parse!
    after = Product.all.count
    if @product_upload.length > 0
      column_names = @product_upload.first.keys
      flash[:notice] = "Data in column(s) #{column_names.join(', ')} not added."
    end
    if before == after
      flash[:alert] = "All products already in database."
    else
      flash[:alert] = "Batch upload completed, #{after - before} without errors."
    end
    redirect_to products_path
  end
end
