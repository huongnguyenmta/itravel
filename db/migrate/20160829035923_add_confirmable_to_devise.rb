class AddConfirmableToDevise < ActiveRecord::Migration[5.0]
  # Note: You can't use change, as User.update_all will fail in the down migration
  def change
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string
  end
end
