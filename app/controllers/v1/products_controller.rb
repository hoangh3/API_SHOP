class V1::ProductsController < V1::BaseController
  def index
    @products = Product.where(search_products_with_params(params)).order(:id).page(params[:page]).per(9)
    @products_size = Product.where(search_products_with_params(params)).count
    render json: @products, total_count: @products_size
    # render json: @products
  end

  def show
    @product = Product.find_by(id: params[:id])
    render json: @product, serializer: ProductShowSerializer
  end

  private
    def search_products_with_params(params)
      # hash = {}
      # if params[:sex_id].present? || params[:category_id].present? || params[:producer_id].present?
      #   hash = {
      #     params.first[0] => params.first[1]
      #   }
      # end
      # hash
      params.permit(:sex_id, :category_id, :producer_id)
      # if params[:a].present?
      #   params[:a] = eval(params[:a])
      #   params[:a].each do |key, value|
      #     hash.merge!(key => value) 
      #   end
      # end

      # return hash if params[:a].blank?
      # params[:a].each do |key, value|
      #   hash.merge(key => value)
      # end
    end
end
