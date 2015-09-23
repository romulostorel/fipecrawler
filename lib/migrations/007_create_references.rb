Sequel.migration do
  change do
    create_table(:references) do
      Integer :id, primary_key: true
      String :label
      Integer :code
    end
  end
end
