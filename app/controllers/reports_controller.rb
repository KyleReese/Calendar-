class ReportsController < ApplicationController
  def index
  	@data = Metric.all
  end
end
