class UpdatePostCounter < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :posts_count, 0
  end
end
