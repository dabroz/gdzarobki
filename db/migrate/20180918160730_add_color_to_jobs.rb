class AddColorToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :color, :string
  end
end
