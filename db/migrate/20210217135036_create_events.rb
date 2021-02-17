class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string    :title
      t.datetime  :date
      t.string    :adress
      t.text      :description
      t.integer   :status
      t.integer   :participate
      t.integer   :maybe_participate
      t.integer   :not_participate
      t.text      :image_data

      t.timestamps
    end
  end
end
