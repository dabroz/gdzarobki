class Entry < ApplicationRecord
  belongs_to :job_type
  belongs_to :city
  belongs_to :skill
  belongs_to :age
  belongs_to :contract
end
