class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :package_name

      t.timestamps
    end
  end
end
