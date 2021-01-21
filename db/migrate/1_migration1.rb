class Migration1 < ActiveRecord::Migration[6.0]
  def change
    create_table(:tables) { |t| t.timestamps }
  end
end
