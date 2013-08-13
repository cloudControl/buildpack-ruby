Ruby buildpack
==============

This is a [buildpack](https://www.cloudcontrol.com/dev-center/Platform%20Documentation#buildpacks-and-the-procfile) for Ruby, Rack, JRuby, Rubinius and Rails apps. It uses [Bundler](http://gembundler.com) for dependency management.

Usage
-----

This is our default buildpack for Ruby/Rack/JRuby/Rubinius/Rails applications. In case you want to introduce some changes, fork our buildpack, apply changes and test it via [custom buildpack feature](https://www.cloudcontrol.com/dev-center/Guides/Third-Party%20Buildpacks/Third-Party%20Buildpacks):

~~~bash
$ cctrlapp APP_NAME create custom --buildpack https://githubcom/cloudControl/buildpack-ruby.git
~~~

The buildpack will detect your app as Ruby if it has a `Gemfile` and `Gemfile.lock` files in the root directory. It will then proceed to run `bundle install` after setting up the appropriate environment for [ruby](http://ruby-lang.org) and [Bundler](http://gembundler.com).

Flow
----

Here's the basic flow of how the buildpack works:

Ruby (Gemfile and Gemfile.lock is detected)

* runs Bundler
* installs binaries
  * installs node if the gem execjs is detected
* runs `rake assets:precompile` if the rake task is detected

Rack (config.ru is detected)

* everything from Ruby
* sets RACK_ENV=production

Rails 2 (config/environment.rb is detected)

* everything from Rack
* sets RAILS_ENV=production
* install rails 2 plugins
  * [rails_log_stdout](http://github.com/ddollar/rails_log_stdout)

Rails 3 (config/application.rb is detected)

* everything from Rails 2
* install rails 3 plugins
  * [rails3_server_static_assets](https://githubcom/pedro/rails3_serve_static_assets)

Bundler
-------

For non-windows `Gemfile.lock` files, the `--deployment` flag will be used. In the case of windows, the Gemfile.lock will be deleted and Bundler will do a full resolve so native gems are handled properly. The `vendor/bundle` directory is cached between builds to allow for faster `bundle install` times. `bundle clean` is used to ensure no stale gems are stored between builds.

Rails
-------

### Rails 2

The buildpack will detect your app as a Rails 2 app if it has a `environment.rb` file in the `config`  directory.

#### Rails Log STDOUT

A [rails_log_stdout](http://github.com/ddollar/rails_log_stdout) is installed by default so Rails' logger will log to STDOUT, which then will be redirected in web container to syslog. See our [platform documentation](https://www.cloudcontrol.com/dev-center/Platform%20Documentation#logging) for more information realted to logging.

#### Auto Injecting Plugins

Any vendored plugin can be stopped from being installed by creating the directory it's installed to in the application directory. For instance, to prevent rails_log_stdout plugin from being injected, add `vendor/plugins/rails_log_stdout/.gitkeep` to your git repo.

### Rails 3

The buildpack will detect your apps as a Rails 3 app if it has an `application.rb` file in the `config` directory.

#### Assets

To enable static assets being served on the web container, [rails3_serve_static_assets](http://github.com/pedro/rails3_serve_static_assets) is installed by default. If the [execjs gem](http://github.com/sstephenson/execjs) is detected then [node.js](http://github.com/joyent/node) will be vendored. The `assets:precompile` rake task will get run if no `public/manifest.yml` is detected.

For more information related to Rails on cloudControl visit our [rails guide](https://www.cloudcontrol.com/dev-center/Guides/Ruby/RailsNotes).

Choose your Ruby version
------------------

cloudControl provides Ruby 1.9.3 as default version. Anyway you can choose the version you want just adding one line to your `Gemfile`:


```ruby
source 'https://rubygems.org'
ruby '1.9.3'
...
```

You can also specify a jRuby or Rubinius version this way, respectively:

```ruby
source 'https://rubygems.org'
ruby '1.9.3', engine: 'jruby', engine_version: '1.7.4'
...
```

```ruby
source 'https://rubygems.org'
ruby '1.9.3', engine: 'rbx', engine_version: '2.0.0.m8'
...
```

List of supported versions:

* ruby-2.0.0
* ruby-1.9.3
* ruby-1.9.2
* ruby-1.8.7
* ruby-1.9.3-jruby-1.7.4
* ruby-1.8.7-jruby-1.7.4
* ruby-2.0.0-rbx-2.0.0.m8
* ruby-1.9.3-rbx-2.0.0.m8
* ruby-1.8.7-rbx-2.0.0.m8
