class RenameSevicecategoriesColumnToInquiry < ActiveRecord::Migration[5.1]
  def change
  	rename_column :inquiries, :sevicecategories, :servicecategories
  end
end
