class RemoveFullNameFromReaders < ActiveRecord::Migration

  def up
    remove_column :readers, :full_name
  end

  def down
  add_column :readers, :full_name, :string

    Reader.all.each do |reader|
      full_name = "#{reader.first_name} #{reader.last_name}"
        reader.update_attribute :full_name, full_name
    end

  change_column :readers, :full_name, :string, null: false
  end
end
