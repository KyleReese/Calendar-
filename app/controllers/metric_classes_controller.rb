class MetricClassesController < ApplicationController
  def show
    @metric_class = MetricClass.find(params[:id])
  end
end
