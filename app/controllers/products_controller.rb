class ProductsController < ApplicationController
  def find_product
  	@product = Product.find(params[:id])
  end

  def index
  	@products = if params[:search]
      Product.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    else
      Product.order('products.created_at DESC').page(params[:page])
    end

    # if request.xhr?
    #   render @products
    # end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
  	@product = Product.new
  end

  def show
  	@product = Product.find(params[:id])

    if current_user
      @review = @product.reviews.build
    end
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
