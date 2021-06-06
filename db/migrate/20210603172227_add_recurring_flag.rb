class AddRecurringFlag < ActiveRecord::Migration[6.0]
  def change
    add_column :todo_items, :isrecurring, :boolean
  end
end
