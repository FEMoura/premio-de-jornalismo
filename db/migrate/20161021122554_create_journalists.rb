class CreateJournalists < ActiveRecord::Migration
  def change
    create_table :journalists do |t|
      t.string :name
      t.string :cpf

      t.timestamps null: false
    end
  end
end
