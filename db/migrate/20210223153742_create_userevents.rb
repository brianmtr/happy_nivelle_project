class CreateUserevents < ActiveRecord::Migration[6.1]
  def change
    create_table :userevents do |t|
      t.integer   :state
      t.references :users, foreign_key: true
      t.references :events, foreign_key: true


      t.timestamps
    end
  end
end
