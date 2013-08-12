# container for all constants including vendor-specific ones
module Configs

  NAME = "ruby"
  BUILDPACK_VERSION = "v77"
  DEFAULT_RUBY_VERSION = "ruby-1.9.3"

  PAAS_VENDOR_FOLDER  = "vendor/cloudcontrol"
  LIBYAML_VERSION     = "0.1.4"
  LIBYAML_PATH        = "libyaml-#{LIBYAML_VERSION}"
  BUNDLER_VERSION     = "1.3.2"
  BUNDLER_GEM_PATH    = "bundler-#{BUNDLER_VERSION}"
  NODE_VERSION        = "0.4.7"
  NODE_JS_BINARY_PATH = "node-#{NODE_VERSION}"
  RBX_BASE_URL        = "http://binaries.rubini.us/heroku"

  S3_BASE        = "https://s3-eu-west-1.amazonaws.com"
  S3_BUCKET_NAME = "#{ ENV["DOMAIN"] }.packages"
  S3_RUBY_DIR    = "buildpack-ruby"
  S3_JAVA_DIR    = "buildpack-java"
  JVM_VERSION    = "openjdk7"
  VENDOR_URL     = "#{S3_BASE}/#{S3_BUCKET_NAME}/#{S3_RUBY_DIR}"
  JVM_BASE_URL   = "#{S3_BASE}/#{S3_BUCKET_NAME}/#{S3_JAVA_DIR}"
end
