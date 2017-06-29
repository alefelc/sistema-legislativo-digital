# Prevent restarting spring services when new classes were added.
%w(
  .ruby-version
  .rbenv-vars
  tmp/restart.txt
  tmp/caching-dev.txt
  app/services
).each { |path| Spring.watch(path) }
