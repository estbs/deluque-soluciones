class SuppliersController < ApplicationController
  before_action :authenticate_user!
  before_action :assign_supplier, only: %i[show edit update destroy]

  def index
    @suppliers = Supplier.all
  end

  def show; end

  def new
    @supplier = Supplier.new
    @supplier.build_address
  end

  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      redirect_to :suppliers
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @supplier.update(supplier_params)
      redirect_to supplier_path(@supplier)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @supplier.destroy
    redirect_to suppliers_path
  end

  private

  def supplier_params
    params.require(:supplier)
          .permit(
            :name,
            :photo,
            quality_ids: [],
            address_attributes: %i[id street city state country]
          )
  end

  def assign_supplier
    @supplier = Supplier.find(params[:id])
  end
end
