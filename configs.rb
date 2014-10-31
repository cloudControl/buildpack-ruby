# container for all constants including vendor-specific ones
module Configs

  NAME = "ruby"
  BUILDPACK_VERSION = "v77"
  DEFAULT_RUBY_VERSION = "ruby-2.0.0"

  PAAS_VENDOR_FOLDER  = "vendor/cloudcontrol"
  LIBYAML_VERSION     = "0.1.4"
  LIBYAML_PATH        = "libyaml-#{LIBYAML_VERSION}"
  BUNDLER_VERSION     = "1.6.3"
  BUNDLER_GEM_PATH    = "bundler-#{BUNDLER_VERSION}"
  NODE_VERSION        = "0.4.7"
  NODE_JS_BINARY_PATH = "node-#{NODE_VERSION}"
  RBX_BASE_URL        = "http://binaries.rubini.us/heroku"

  BUCKET_NAME = "https://packages.#{ ENV["DOMAIN"] }"
  RUBY_DIR    = "buildpack-ruby"
  JAVA_DIR    = "buildpack-java"
  JVM_VERSION    = "openjdk7"
  VENDOR_URL     = "#{BUCKET_NAME}/#{RUBY_DIR}"
  JVM_BASE_URL   = "#{BUCKET_NAME}/#{JAVA_DIR}"
end
