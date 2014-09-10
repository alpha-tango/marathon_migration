class AddReadersKeyInCheckouts < ActiveRecord::Migration

  def up
    add_column :checkouts, :reader_id, :integer

    Checkout.reset_column_information

    Checkout.all.each do |checkout|
      attributes = {full_name: checkout.person}
      reader = Reader.find_or_create_by(attributes)
        checkout.update_attribute :reader_id, reader.id
    end
  end

  def down
    remove_column :checkouts, :reader_id
  end
end
