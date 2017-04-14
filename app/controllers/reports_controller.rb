class ReportsController < ApplicationController
  def index
    metric_class = MetricClass.find(params[:metric_class_id])
    max = params[:filter][:max]
    min = params[:filter][:min]

    @analytics = {
      standard_deviation: params[:analysis] == 'standard_deviation' ? true : false,
    }
    @data = metric_class.metrics
      .map { |e| e.int_val }
      .select { |e| !min.empty? ? e > min.to_i : true }
      .select { |e| !max.empty? ? e < max.to_i : true }
      .extend(DescriptiveStatistics)
  end
end
