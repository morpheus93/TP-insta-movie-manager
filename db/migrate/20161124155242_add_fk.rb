class AddFk < ActiveRecord::Migration
  def change
    add_foreign_key  :movies, :categories
  end
end
