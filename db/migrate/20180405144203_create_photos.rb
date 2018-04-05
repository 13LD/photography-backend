class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :file
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
