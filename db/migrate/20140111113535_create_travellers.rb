class CreateTravellers < ActiveRecord::Migration
  def change
    create_table :travellers do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.string :address
      t.string :travelling_from
      t.string :travelling_to
      t.date :travel_date
      t.string :conditions

      t.timestamps
    end
  end
end
