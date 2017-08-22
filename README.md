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

`bundle`
`npm`
`npm install webpack -g` <-- if you don't have Webpack command line

### Build

`bundle exec rake build`

## Running the server

`bundle exec rake server`
