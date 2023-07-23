class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :nik
      t.string :name
      t.string :gender
      t.string :birth_place
      t.date :birth_date
      t.string :ktp_address
      t.string :domisili
      t.string :religion
      t.string :marital_status

      t.timestamps
    end
  end
end
