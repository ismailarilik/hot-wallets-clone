# hot-wallets-clone [![Rails Style Guide](https://img.shields.io/badge/code_style-community-brightgreen.svg)](https://rails.rubystyle.guide)

A clone of the HOTWallets web application ([https://hotwallets-staging.herokuapp.com/](https://hotwallets-staging.herokuapp.com/)) written with Ruby on Rails and Tailwind CSS

![Screenshot](https://github.com/ismailarilik/hot-wallets-clone/blob/main/screenshot.png?raw=true)

## Requirements

- [SQLite version 3.x](https://www.sqlite.org/download.html)
- [Ruby](https://www.ruby-lang.org/en/downloads/)
- Ruby on Rails (`gem install rails`)
- Install dependencies (`bundle install`)
- Run DB migrations (`bin/rails db:migrate`)

## Running app

```sh
./bin/dev
```

Then navigate to [localhost:3000](localhost:3000).

## Running static code analysis tool (Rubocop)

```sh
rubocop
```

## Running unit tests

```sh
bin/rails test
```

## Running system tests

```sh
bin/rails test:system
```
