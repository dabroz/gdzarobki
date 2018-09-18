class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.integer :job_type_id
      t.integer :skill_id
      t.integer :age_id
      t.integer :contract_id
      t.integer :city_id
      t.decimal :income
      t.string :delete_code

      t.timestamps
    end
  end
end
