class V1::CategoriesController < V1::BaseController
  def index
    @categories = Category.all
    render json: @categories
  end
end
