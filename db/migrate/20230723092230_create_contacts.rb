class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :phone
      t.string :email
      t.string :npwp
      t.string :bpjs_kesehatan
      t.string :bpjs_ketenagakerjaan
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
