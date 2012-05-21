* Lab 02 - Taking a look at start-up time

Going to tweak the test and see how various methods of starting JRuby
affect startup time on your machine.

By the end of this lab, you should be comfortable with:

1. Passing flags to the JVM from jruby
2. Examining how various flags affect startup performance

For various data sizes, see how the flags affect overall time.  Flags to try:

- --1.9
- -X-C
- -J-XX:+TieredCompilation
- -J-client
- --ng-server, --ng

Step 1: Run specs using -J-client
$ time ITERATIONS=jruby -J-client -S rspec

Step 2: Run specs using -X-C (to turn JRuby compilation off)
$ time jruby -X-C -S rspec

Step 3: Run specs with nailgun
$ jruby --ng-server
$ jruby --ng -S rspec
