# RailsBoilerplate

Sane defaults for your next project.

## Already setup for you

- Stimulus.js
- GitHub Actions
- Rubocop
- Turbo ready
- Uses postgreSQL

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
