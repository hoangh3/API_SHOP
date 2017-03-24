class V1::ProducersController < V1::BaseController
  def index
    @producers = Producer.all
    render json: @producers
  end
end
