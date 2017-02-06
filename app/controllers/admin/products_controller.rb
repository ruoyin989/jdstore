class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:create,:update,:destroy]

  def index
      @products =Product.all.order("created_at DESC")
    end
    def show
        @product =Product.find(params[:id])
      end

      def edit
        @product =Product.find(params[:id])
      end

      def new
        @product =Product.new
      end

      def update
      @product =Product.find(params[:id])
        if @product.update(product_params)
          redirect_to admin_products_path
        else
          render :edit
        end
      end

      def create
        @product =Product.new(params[:id])
        if @product.save
          redirect_to admin_products_path
        else
          render :new
        end
      end

      def destroy
        @product =Product.find(params[:id])
        @product.destroy
        redirect_to admin_products_path
      end


    private
      def product_params
        params.require(:job).permit(:title, :description, :quantity, :price)
      end






    end
