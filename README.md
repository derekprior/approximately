# Approximately
Count queries without a where clause cause PostgreSQL to do a full table
scan to count the exact number of rows. Approximately uses metadata stored
by PostgreSQL to return an approximate count of the rows without the full
table scan.

The number will be correct as of the last `VACUUM` or `ANALYZE` on the table.
This makes it appropriate for any statistics that should be updated regularly
but do not necessarily need to be live. For more on row estimation, see
[the Postgres documentation][1].

[1]: http://www.postgresql.org/docs/9.2/static/row-estimation-examples.html

## Installation

Add this line to your application's Gemfile:

    gem 'approximately'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install approximately

## Usage

```ruby
ApproximateCount.of(Vote.table_name) # => 256233
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
