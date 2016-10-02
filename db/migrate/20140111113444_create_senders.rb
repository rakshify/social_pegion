class CreateSenders < ActiveRecord::Migration
  def change
    create_table :senders do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.string :address
      t.string :send_from
      t.string :send_to
      t.integer :send_date_range
      t.string :item_description

      t.timestamps
    end
  end
end
