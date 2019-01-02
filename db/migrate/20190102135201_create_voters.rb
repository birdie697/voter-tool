class CreateVoters < ActiveRecord::Migration[5.2]
  def change
    create_table :voters do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :street, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.decimal :lat, null: false
      t.decimal :lng, null: false
      t.string :vote, null: false

      t.timestamps
    end
  end
end
