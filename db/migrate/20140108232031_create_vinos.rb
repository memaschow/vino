class CreateVinos < ActiveRecord::Migration
  def change
    create_table :vinos do |t|
      t.string :name
      t.string :discription

      t.timestamps
    end
  end
end
