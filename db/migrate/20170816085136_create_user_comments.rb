class CreateUserComments < ActiveRecord::Migration[5.1]
  def change
    create_table :user_comments do |t|
      t.references :user, foreign_key: true
      t.text :subject
      t.text :content

      t.timestamps
    end
  end
end
