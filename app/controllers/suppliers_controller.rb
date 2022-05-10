class SuppliersController < ApplicationController

  before_action :authenticate_user!

  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def new
    @supplier = Supplier.new
    @supplier.build_address
  end

  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      redirect_to :suppliers
    else
      render :new
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update(supplier_params)
      redirect_to supplier_path(@supplier)
    else
      render :edit
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy
    redirect_to suppliers_path
  end

  private

  def supplier_params
    params.require(:supplier)
          .permit(
            :name,
            :photo,
            address_attributes: %i[id street city state country]
          )
  end
end
