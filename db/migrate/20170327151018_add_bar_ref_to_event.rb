class AddBarRefToEvent < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :bar, foreign_key: true
  end
end
