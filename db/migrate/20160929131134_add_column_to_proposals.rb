class AddColumnToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :title, :string
    add_column :proposals, :vehicle, :string
    add_column :proposals, :publication_date, :string
    add_column :proposals, :name_member_1, :string
    add_column :proposals, :cpf_member_1, :string
    add_column :proposals, :name_member_2, :string
    add_column :proposals, :cpf_member_2, :string
    add_column :proposals, :name_member_3, :string
    add_column :proposals, :cpf_member_3, :string
    add_column :proposals, :name_member_4, :string
    add_column :proposals, :cpf_member_4, :string
    add_column :proposals, :name_member_5, :string
    add_column :proposals, :cpf_member_5, :string
    add_column :proposals, :url, :string
  end
end
