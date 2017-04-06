class MetricClassesController < ApplicationController
  def show
    @metric_class = MetricClass.find(params[:id])
    @data = case @metric_class.metric_type
    when MetricClass.types[:integer]
      @metric_class.metrics.map { |m| {id: m.id, name: m.metric_class.name, val: m.int_val}}
    when MetricClass.types[:boolean]
      @metric_class.metrics.map { |m| {id: m.id, name: m.metric_class.name, val: m.boolean_val}}
    when MetricClass.types[:time]
      @metric_class.metrics.map { |m| {id: m.id, name: m.metric_class.name, val: m.time_val}}
    end
  end
end
