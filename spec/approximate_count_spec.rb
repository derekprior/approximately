require 'bundler/setup'
require 'approximately'

describe ApproximateCount do
  describe '.of' do
    it 'gets an approximate count of rows for the table provided' do
      connection = double('Connection', execute: pg_result)

      count = ApproximateCount.of(table, connection)

      expect(count).to be expected_count
      expect(connection).to have_received(:execute).with(sql)
    end

    def expected_count
      42
    end

    def table
      'users'
    end

    def sql
      "SELECT reltuples FROM pg_class WHERE relname = '#{table}';"
    end

    def pg_result
      [{ 'reltuples' => expected_count.to_s }]
    end
  end
end
