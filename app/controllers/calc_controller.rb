class CalcController < ApplicationController
  protect_from_forgery
  def index
    Basket.init
    JSON.parse(request.body.read)["items"].each do |item|
      Basket.add(item["name"], item["count"])
      # sleep 0.001
    end
    render json: Basket.result
  end
end
