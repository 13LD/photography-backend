class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :phone1
      t.string :phone2

      t.timestamps
    end
  end
end
