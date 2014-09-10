class SeparateFirstLastNamesInReadersTable < ActiveRecord::Migration
  def up
    add_column :readers, :first_name, :string
    add_column :readers, :last_name, :string

    Reader.all.each do |reader|
      attributes = {first_name: reader.full_name.split.first,
                    last_name: reader.full_name.split.last}
        reader.update_attribute :first_name, attributes[:first_name]
        reader.update_attribute :last_name, attributes[:last_name]
    end

    change_column :readers, :first_name, :string, null: false
    change_column :readers, :last_name, :string, null: false
  end

  def down
    remove_column :readers, :first_name, :string
    remove_column :readers, :last_name, :string
  end
end
