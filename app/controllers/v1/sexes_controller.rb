class V1::SexesController < V1::BaseController
  def index
    @sexes = Sex.all
    render json: @sexes
  end
end

