# Bridgetown Website README

Welcome to your new Bridgetown website! You can update this README file to provide additional context and setup information for yourself or other contributors.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Install](#install)
- [Development](#development)
- [Commands](#commands)
- [Deployment](#deployment)
- [Running on Heroku](#running-on-heroku)
- [Contributing](#contributing)

## Prerequisites

- [GCC](https://gcc.gnu.org/install/)
- [Make](https://www.gnu.org/software/make/)
- [Ruby](https://www.ruby-lang.org/en/downloads/)
  - `>= 2.5`
- [Bridgetown Gem](https://rubygems.org/gems/bridgetown)
  - `gem install bridgetown -N`
- [Node](https://nodejs.org)
  - `>= 12`
- [Yarn](https://yarnpkg.com)

## Install

```sh
cd bridgetown-site-folder
bundle install && yarn install
```
> Learn more: [Bridgetown Getting Started Documentation](https://www.bridgetownrb.com/docs/).

## Development

To start your site in development mode, run `bin/bridgetown start` and navigate to [localhost:4000](https://localhost:4000/)!

Use a [theme](https://github.com/topics/bridgetown-theme), add some [plugins](https://www.bridgetownrb.com/plugins/), and/or run some [automations](https://github.com/topics/bridgetown-automation) to get started quickly.

### Commands

```sh
# running locally
bin/bridgetown start

# build & deploy to production
bin/bridgetown deploy

# load the site up within a Ruby console (IRB)
bin/bridgetown console
```

> Learn more: [Bridgetown CLI Documentation](https://www.bridgetownrb.com/docs/command-line-usage)

## Deployment

You can deploy Bridgetown sites on "Jamstack" hosts (Netlify, Vercel, Render, etc.) or virtually any tranditional web server by simply building and copying the output folder to your HTML root.

> Read the [Bridgetown Deployment Documentation](https://www.bridgetownrb.com/docs/deployment) for more information.

### Running on Heroku

Skipping over the default Heroku actions...

Ensure both `heroku/ruby` and `heroku/nodejs` are configured buildpacks. In that order, too. The latter is required to pick up `heroku-postbuild` as a script in `package.json`. This will runn `bridgetown deploy` and ensure all the static-y stuff is ready to go and added to the slug. Without it, Webpack cannot find the manifest file, because `.bridgetown-webpack` is in `.gitignore`; it is single-build-specific.

Set `BRIDGETOWN_ENV` to `production` on the Heroku app with:

```sh
$ heroku config:set BRIDGETOWN_ENV=production
```

Bridgetown looks for `$BRIDGETOWN_PORT` to determine which port to bind to, but Heroku uses `$PORT`. I've changed that in `puma.rb` but the Bridgetown gem still looks for the former. The log output will print `4000` erroneously, but not until after Puma also prints the port its binding to (the correct one). One coule probably set `$BRIDGETOWN_PORT` to `$PORT`, but that seems kind of silly. Bonus points if Bridgetown adopts `$PORT` down the road. :)

Once it's all configured, `git push heroku` and peel out. 

## Contributing

If repo is on GitHub:

1. Fork it
2. Clone the fork using `git clone` to your local development machine.
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request