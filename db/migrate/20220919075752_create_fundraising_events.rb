class CreateFundraisingEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :fundraising_events do |t|
      t.string :name, null: false
    end
  end
end
