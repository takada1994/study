class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|

      t.integer :number, null: false
      t.string :name, null: false
      t.string :full_name
      t.string :email
      t.date :birthday
      t.integer :sex, null: false, default: 1       #性別（1.男、2.女）
      t.boolean :administrator, null: false, default: false  #管理者フラグ

      t.timestamps
    end
  end
end
