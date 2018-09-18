class Job < ApplicationRecord
  has_many :job_types, dependent: :destroy
end
