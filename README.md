# Rails application as a plugin for a clean-architecture component

## Installation

1. if not already, pull [the component](https://github.com/riccardo-giomi/fundraising_events) somewhere, for example in `~/projects/`;

2. pull this project alongside the component's directory, following the previous example, this would still be in `~/projects/`;

3. link the fundraising_event directory in the root of the Rails app, for example:

```bash
cd ~/projects/fundraising_events_rails
ln -s ../fundraising_events .
```

4. do the usual Rails installation stuff:

```bash
bundle
bundle exec rails db:create db:migrate
bundle exec rspec
```
