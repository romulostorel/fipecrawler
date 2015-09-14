Sequel.migration do
  change do
    create_table(:brands) do
      Integer :id, primary_key: true
      String :name
    end
  end
end
