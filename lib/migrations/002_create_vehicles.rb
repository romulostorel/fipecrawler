Sequel.migration do
  change do
    create_table(:vehicles) do
      Integer :id, primary_key: true
      String :name
      Integer :brand_id
    end
  end
end
