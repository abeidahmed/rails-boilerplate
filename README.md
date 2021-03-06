# RailsBoilerplate

Sane defaults for your next project.

## Requirements

- Ruby 3.0.2
- Rails 6.1.4

## Already setup for you

- Authentication using warden
- Stimulus.js
- Sidekiq
- Turbo ready
- Uses postgreSQL
- Rubocop
- Prettier
- GitHub Actions

## Running sidekiq

```bash
bundle exec sidekiq
```

Configurations can be found at `./config/sidekiq.yml`

You can view your jobs at `localhost:3000/sidekiq`

## Rename this app

After cloning and installing the app, you probably need to rename
this project. Currently, it is named as `RailsBoilerplate`, but
if you want to change all occurrences of `RailsBoilerplate` to
`TaskManagement`, you need to run

```bash
perl -e "s/RailsBoilerplate/TaskManagement/g;" -pi $(find . -type f)
```

If you'd also like to rename your databases, run

```bash
perl -e "s/rails_boilerplate/task_management/g;" -pi $(find . -type f)
```

## Licence

MIT licensed.
