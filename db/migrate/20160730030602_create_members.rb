class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :nickname
      t.string :job
      t.string :department
      t.string :motivation
      t.string :others
      t.string :fb
      t.string :email

      t.timestamps
    end
  end
end
