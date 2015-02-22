class Error < ActiveRecord::Base
  def resource_not_found(resource)
    "The asked resource #{resource} could not be found"
  end
end
