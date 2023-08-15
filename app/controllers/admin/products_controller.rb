class Admin::ProductsController < Admin::AdminController
    def index
        @products = Product.all
    end

    def show 
        @product = Product.find(params[:id])
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
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:product][:id])
        if @product.update(product_params)
            flash[:success] = "Product updated"
            redirect_to admin_products_path
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def destroy
        Product.find(params[:id]).destroy
    end

    private

    def product_params
        params.require(:product).permit(:name, :description, :price, :quantity, images: [])
    end
end