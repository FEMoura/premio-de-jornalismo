class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :cpf
      t.string :rg
      t.string :gender
      t.string :phone
      t.string :mte
      t.string :adress
      t.string :city
      t.string :state

      t.timestamps null: false
    end
  end
end
