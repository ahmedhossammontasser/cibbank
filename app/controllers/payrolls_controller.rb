class PayrollsController < ApplicationController
  before_filter :set_payroll, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @payrolls = Payroll.all
    respond_with(@payrolls)
  end

  def show
    respond_with(@payroll)
  end

  def new
    @payroll = Payroll.new
    respond_with(@payroll)
  end

  def edit
  end

  def create
    @payroll = Payroll.new(params[:payroll])
    @payroll.save
    respond_with(@payroll)
  end

  def update
    @payroll.update_attributes(params[:payroll])
    respond_with(@payroll)
  end

  def destroy
    @payroll.destroy
    respond_with(@payroll)
  end

  private
    def set_payroll
      @payroll = Payroll.find(params[:id])
    end
end
