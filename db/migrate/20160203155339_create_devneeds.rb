class CreateDevneeds < ActiveRecord::Migration
  def change
    create_table :devneeds do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
