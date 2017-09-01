# Hyperloop Website V3

## Work in progress!

The new website will:

+ be a 100% Hyperloop SPA (featuring Components, Stores, Routes and Operations)
+ be built with Opal and Webpack (no Middleman)
+ demonstrate the use of hyperloop-js as a simple alternative deployment method (hyperloop-js coming in via NPM)
+ consist of just three files (index.html, app.js and app.css)
+ have super fast client-side search
+ will use HyperRouter for routing
+ ultra-responsive UI based on SemanticUIReact (we are ditching bootstrap)
+ work online and offline
+ HTTP.get all DOCS pages directly from the gems with client-side markdown
+ have live editing with (hopefully) a Ruby linter and good error messages
+ will be as SEO friendly as the current site (through pre-rendering)
+ be beautiful to behold!

## Setup and build

### Setup

+ `bundle`
+ `npm install`
+ `npm install webpack -g` <-- if you don't have Webpack command line
+ `npm install webpack-dev-server -g`

### Build

+ To build packs.js: `webpack` (-p for production mode)

+ To build app.js: `bundle exec rake build`

## Running the server

+ `bundle exec rake server` (will build app.js and copy index.html from source to dist)

or..

+ `webpack-dev-server --progress --colors` <-- http://localhost:8080/webpack-dev-server/bundle

## Code blocks

### Runable code blocks

Code blocks need to render properly in Github and also on the site. Some code blocks are live and runanle.

Normal code block - `three-backticks ruby`
```ruby
class MyComp < Hyperloop::Component
  render do
    H1 { 'Hello world' }
  end
end
```

Runable code block - `three-backticks ruby runable`

```ruby runable
class MyComp < Hyperloop::Component
  render do
    H1 { 'Hello world' }
  end
end
```

All runable code blocks must have a Hyperloop Component `class Anything < Hyperloop::Component` somewhere near the beginning of the code block.
