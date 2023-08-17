class Admin::ProductsController < Admin::AdminController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Product created"
      redirect_to admin_products_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:success] = "Product updated"
      redirect_to admin_products_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = "Product deleted"
      redirect_to admin_products_path, status: :see_other
    else
      redirect_to request.referrer, status: :see_other
    end
  end

  private

    def find_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :quantity, images: [])
    end
end
