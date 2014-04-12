class ProductUploadsController < ApplicationController

  def new
  end

  def create
    @product_upload = ProductUpload.new(params[:file].tempfile).parse!
    if @product_upload.length > 0
      column_names = @product_upload.first.keys
      flash[:notice] = "Data in column(s) #{column_names.join(', ')} not added."
    else
      flash[:notice] = "Batch upload completed without errors."
    end
    redirect_to products_path
  end
end
