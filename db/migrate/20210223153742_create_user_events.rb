class CreateUserEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :user_events do |t|
      t.integer   :state
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true

    end
  end
end
