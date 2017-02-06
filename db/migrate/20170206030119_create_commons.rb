class CreateCommons < ActiveRecord::Migration[5.0]
  def change
    create_table :commons do |t|

      t.timestamps
    end
  end
end
