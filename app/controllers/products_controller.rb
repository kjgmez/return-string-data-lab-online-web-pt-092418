class ProductsController < ApplicationController
  def create
    @product = Product.create(prod_params)
    redirect_to products_path
  end

  def index
    @products = Product.all
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory > 0 ? "true" : "false"
  end

  private

  def prod_params
    params.require(:product).permit(:name, :inventory, :description, :price)
  end
end
