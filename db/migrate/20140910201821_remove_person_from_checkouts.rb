class RemovePersonFromCheckouts < ActiveRecord::Migration
  def up
    remove_column :checkouts, :person
  end

  def down
    add_column :checkouts, :person, :string

    Checkout.reset_column_information

    Checkout.all.each do |checkout|
      attributes = {id: checkout.reader_id}
      reader = Reader.find_or_create_by(attributes)
        checkout.update_attribute :person, reader.full_name
    end

    change_column :checkouts, :person, :string, null: false
  end
end
