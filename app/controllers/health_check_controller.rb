class HealthChecksController < ActionController::Base
  def health_check
    head 200
  end
end
