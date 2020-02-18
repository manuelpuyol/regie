# frozen_string_literal: true

require './db/mysql/connection'

RSpec.shared_examples 'a DB record' do |table_name|
  describe 'database compatibility' do
    let(:connection) { DB::MySQL::Connection.new.connection }

    it 'must have the correct table_name' do
      expect(described_class.table_name).to eq(table_name)
    end

    it 'must have the correct columns' do
      query = connection.query("SHOW COLUMNS FROM #{table_name}").to_a
      db_columns = query.map { |row| row['Field'] }

      expect(described_class.column_names).to match_array(db_columns)
    end
  end
end
