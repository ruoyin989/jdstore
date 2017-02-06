class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:create,:update,:destroy]
  before_action :require_is_admin

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

      def publish
        @product =Product.find(params[:id])
        @product.publish!
        redirect_to :back
      end

      def hide
        @product =Product.find(params[:id])
        @product.hide!
        redirect_to :back
      end

    private
      def product_params
        params.require(:job).permit(:title, :description, :quantity, :price, :is_hidden)
      end






    end
