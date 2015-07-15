# Buildpack for Ruby

This is a
[buildpack](https://www.cloudcontrol.com/dev-center/Platform%20Documentation#buildpacks-and-the-procfile)
for Ruby, Rack, and Rails apps. It uses [Bundler](http://gembundler.com) for
dependency management.


## Usage

The buildpack will detect your app as Ruby if it has a `Gemfile` and
`Gemfile.lock` files in the root directory. It will then proceed to run `bundle
install` after setting up the appropriate environment for
[Ruby](http://ruby-lang.org) and [Bundler](http://gembundler.com).


## Supported versions

We support all current (current, previous, old stable) Ruby versions.

Please contact support@cloudcontrol.de in case you miss a version of
Ruby or encounter a problem.


## Documentation

https://www.cloudcontrol.com/dev-center/guides#ruby
