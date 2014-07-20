class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :home_phone
      t.string :cell_phone
      t.string :email
      t.text :notes

      t.timestamps
    end
  end
end
