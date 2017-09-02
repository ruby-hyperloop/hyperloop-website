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
+ `npm install webpack@3.4.1 -g` <-- if you don't have Webpack command line
+ `npm install webpack-dev-server -g`

### Build

+ To build packs.js: `webpack` (-p for production mode)

+ To build app.js: `bundle exec rake build`

## Running the server

+ To build the Opal code then run the server: `rake server`

+ To run the server: `foreman start`

Browse `localhost:8080`

## Code blocks

### Runable code blocks

Code blocks need to render properly in Github and also on the site. Some code blocks are live and runanle.

Normal code block - (three-backticks ruby)
<PRE>
```ruby
class MyComp < Hyperloop::Component
  render(DIV) do
    H1 { 'Hello world' }
  end
end
```
</PRE>

Runable code block - (three-backticks ruby runable)

<PRE>
```ruby runable
class MyComp < Hyperloop::Component
  render(DIV) do
    H1 { 'Hello world' }
  end
end
```
</PRE>

All runable code blocks must have a Hyperloop Component `class Anything < Hyperloop::Component` somewhere near the beginning of the code block.
