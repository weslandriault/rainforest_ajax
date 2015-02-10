class ProductsController < ApplicationController
  def find_product
  	@product = Product.find(params[:id])
  end

  def index
  	@products = Product.all
  end

  def new
  	@product = Product.new
  end

  def show
  	@product = Product.find(params[:id])
  end

  def edit
  	@product = product
  end
  
  def create
  	@product = Product.new(product_params)

    if @product.save
      redirect_to products_url
    else
      render :new
    end
  end

  def update
  	@product = Product.find(params[:id])

  	if @product.update_attributes(product_params)
  		redirect_to product_path(@product)
  	else
  		render :edit
  	end
  end

  def destroy
  	@product = find_product
  	@product.destroy
  	redirect_to product_path
  end

  private
  def product_params
  	params.require(:product).permit(:name, :description, :price_in_cents)
  end
end
