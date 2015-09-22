Sequel.migration do
  change do
    add_column :vehicles, :type, Integer
  end
end
