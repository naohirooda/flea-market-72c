class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.string :customer_id, null: false
      t.string :card_id, null: false
      t.timestamps
    end
  end
end
