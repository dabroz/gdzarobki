class AddIndices < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :index, :integer
    add_column :job_types, :index, :integer
    add_column :cities, :index, :integer
    add_column :ages, :index, :integer
    add_column :contracts, :index, :integer
    add_column :skills, :index, :integer
  end
end
