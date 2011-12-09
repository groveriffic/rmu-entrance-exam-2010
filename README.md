# Read Me

## Full Disclosure

I read the project documentation last night, understood the problem with
    @contents.dup
then slept on it and started actual work this evening.
I started by forking the GitHub repo and was already working on a fix when I realized I was working on code that did not have the naive dup statement.

So I can't take credit for the change tracking approach even though I swear that was on my mind.
I can however take credit for a further > 50% reduction in memory footprint.

    localhost:rmu-entrance-exam ehles$ rake test:ali_rizvi
    Starting Memory:
    1896
    Adding 100 characters, 1 at a time
    Current memory footprint:
    1976
    Adding 1000 characters, 1 at a time
    Current memory footprint:
    2620
    Adding 10000 characters, 1 at a time
    Current memory footprint:
    11196
    Adding 100000 characters, 1 at a time
    Current memory footprint:
    89344
    Took 0.423752s to run
    Loaded suite /Users/ehles/.rvm/gems/ruby-1.8.7-p352/bin/rake
    Started
    ..........
    Finished in 0.001039 seconds.

    10 tests, 14 assertions, 0 failures, 0 errors
    localhost:rmu-entrance-exam ehles$ rake test:ali_rizvi_fixed
    Starting Memory:
    1900
    Adding 100 characters, 1 at a time
    Current memory footprint:
    1992
    Adding 1000 characters, 1 at a time
    Current memory footprint:
    2768
    Adding 10000 characters, 1 at a time
    Current memory footprint:
    11492
    Adding 100000 characters, 1 at a time
    Current memory footprint:
    89596
    Took 0.53237s to run
    Loaded suite /Users/ehles/.rvm/gems/ruby-1.8.7-p352/bin/rake
    Started
    ..........
    Finished in 0.001057 seconds.

    10 tests, 14 assertions, 0 failures, 0 errors
    localhost:rmu-entrance-exam ehles$ rake test:mine
    Starting Memory:
    1904
    Adding 100 characters, 1 at a time
    Current memory footprint:
    1956
    Adding 1000 characters, 1 at a time
    Current memory footprint:
    2288
    Adding 10000 characters, 1 at a time
    Current memory footprint:
    6016
    Adding 100000 characters, 1 at a time
    Current memory footprint:
    34064
    Took 0.354141s to run
    Loaded suite /Users/ehles/.rvm/gems/ruby-1.8.7-p352/bin/rake
    Started
    ..........
    Finished in 0.001017 seconds.

    10 tests, 14 assertions, 0 failures, 0 errors
    localhost:rmu-entrance-exam ehles$ 

## Next Steps 

These are some things I would consider for an actual project

 * Enfoce a maximum limit on the @commands an @reverted arrays
 * Serialize the commands to a TempFile on disk
 * Memoize the contents method (being sure to eraze the memoized copy when actions are preformed)
