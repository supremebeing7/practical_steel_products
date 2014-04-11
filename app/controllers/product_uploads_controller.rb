class ProductUploadsController < ApplicationController

  def new
  end

  def create
    @productUpload = ProductUpload.new(params[:file].tempfile).parse!
    redirect_to products_path, notice: "Batch upload completed."
  end
end
