Sequel.migration do
  change do
    alter_table(:vehicle_years) do
      rename_column :name, :value
    end
  end
end

