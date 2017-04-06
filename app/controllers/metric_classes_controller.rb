class MetricClassesController < ApplicationController
  def show
    @metric_class = MetricClass.find(params[:id])
    @data = case @metric_class.metric_type
    when MetricClass.types[:integer]
      @metric_class.metrics.map(&:int_val)
    when MetricClass.types[:boolean]
      @metric_class.metrics.map(&:boolean_val)
    when MetricClass.types[:time]
      @metric_class.metrics.map(&:time_val)
    end
  end
end
