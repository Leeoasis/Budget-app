class RecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = Category.find(params[:category_id])
    @records = @category.records.order(created_at: :desc)
    @total_amount = @category.records.sum(:amount)
  end

  def new
    @category = Category.find(params[:category_id])
    @record = @category.records.build
  end

  def create
    @category = Category.find(params[:category_id])
    @record = @category.records.build(record_params)
    @record.author = current_user

    if params[:record][:category_ids].present?
      @record.category_ids = params[:record][:category_ids]
    else
      @record.errors.add(:category_ids, 'must be selected')
    end

    if @record.save
      redirect_to category_records_path(@category), notice: 'Record created successfully.'
    else
      render :new
    end
  end

  private

  def record_params
    params.require(:record).permit(:name, :amount, :category_id, category_ids: [])
  end
end
