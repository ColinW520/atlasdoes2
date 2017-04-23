class CreateContactFormSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_form_submissions do |t|
      t.string :name
      t.string :email
      t.string :message

      t.timestamps
    end
  end
end
