class AddCityToOffer < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :city, :string
  end
end
