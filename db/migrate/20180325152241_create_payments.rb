class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.date :starts_at
      t.date :ends_at

      t.belongs_to :user, index: true
    end
  end
end
