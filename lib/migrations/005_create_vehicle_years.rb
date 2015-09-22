Sequel.migration do
  change do
    create_table(:vehicle_years) do
      Integer :id, primary_key: true
      String :name
      String :label
      Integer :vehicle_id
    end
  end
end
