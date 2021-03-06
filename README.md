# Approximately
Count queries without a where clause cause PostgreSQL to do a full table
scan to count the exact number of rows. Approximately uses metadata stored
by PostgreSQL to return an approximate count of the rows without the full
table scan.

The number will be correct immediately following a `VACUUM` or `ANALYZE` on
the table and will not be updated until the next `VACUUM` or `ANALYZE`. This
makes it most appropriate for tables that are subject to [`autovacuum`] on a
regular basis. See the Postgres documentation on [row estimation] and
[autovacuum][2] for more.

[1]: http://www.postgresql.org/docs/9.2/static/row-estimation-examples.html
[2]: http://www.postgresql.org/docs/9.2/static/routine-vacuuming.html#AUTOVACUUM

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
