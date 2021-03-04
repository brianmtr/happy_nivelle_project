class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string    :title
      t.datetime  :date
      t.string    :address
      t.text      :description
      t.integer   :status


      t.timestamps
    end
  end
end
