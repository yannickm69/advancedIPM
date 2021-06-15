# frozen_string_literal: true

class WorkOrder < ApplicationRecord
  belongs_to :technician
  belongs_to :location
end
