class CreateMedianFunction < ActiveRecord::Migration[5.2]
  def up
    ActiveMedian.create_function
  end

  def down
    ActiveMedian.drop_function
  end
end
