class V1::ShowBillsDetailsController < ApplicationController

  def index
  end

  def create
    @all_bills_details = BillDetail.where(bill_id: params[:bill_id])
    render json: {
                  allBillsDetails: @all_bills_details,
                  status: 200,
                  success: true,
                  }
  end

end
