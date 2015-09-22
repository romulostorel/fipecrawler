Sequel.migration do
  change do
    add_column :brands, :type, Integer
  end
end
