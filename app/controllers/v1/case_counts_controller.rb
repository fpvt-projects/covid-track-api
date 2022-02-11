class V1::CaseCountsController < ApplicationController

  # GET /case_counts
  def index
    @case_counts = CaseCount.first

    render json: @case_counts
  end

end
