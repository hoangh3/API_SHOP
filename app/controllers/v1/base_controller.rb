class V1::BaseController < ApplicationController
	# before_action :init_json_response
  before_action :config_session
  $data = {}
  def init_json_response(message = nil, a = nil)
    $data.merge!(message) unless message == nil
    $data.merge!(user: a.as_json) unless a == nil
    $data
  end

  def init_json_customer_response(customer_size = nil, customers = nil)
    $data.merge!(count: customer_size) if customer_size.present?
    $data.merge!(product: customers.as_json) if customers.present?
    $data
  end

  def data
    $data
  end
  
  def config_session
    session["init"] = true
  end
end
