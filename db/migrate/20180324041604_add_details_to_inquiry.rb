class AddDetailsToInquiry < ActiveRecord::Migration[5.1]
  def change
    add_column :inquiries, :tel, :string
    add_column :inquiries, :sevicecategories, :string
  end
end
