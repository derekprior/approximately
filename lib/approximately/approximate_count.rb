class ApproximateCount
  # Gets an aproximate count for a postgres relation (generally a table).
  #
  # @param table [String] The name of the table or view to be counted
  # @param connection An object representing a database connection that
  # responds to `execute`. Defaults to `ActiveRecord::Base.connection)
  #
  # @return [Integer] Approximate row count of the table
  def self.of(table, connection = ActiveRecord::Base.connection)
    new(table, connection).send(:call)
  end

  private

  def initialize(table, connection)
    @table = table
    @connection = connection
  end

  def call
    result = connection.execute "SELECT reltuples FROM pg_class WHERE relname = '#{table}';"
    result[0]['reltuples'].to_i
  end

  attr_reader :table, :connection
end
