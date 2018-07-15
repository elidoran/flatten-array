## 1.1.7 - 2018/07/15

1. second attempt to make the performance.png image show on npmjs.com... by referencing it with an absolute path. The problem is it will always be the newest one, not matching the published version being viewed at npmjs.com. I could do the link to the exact version, but, I'd have to change that link every time I publish new performance results...

## 1.1.6 - 2018/07/15

1. add `docs/performance.png` to the `package.json` `files` array so it will display at [https://www.npmjs.com/package/@flatten/array](https://www.npmjs.com/package/@flatten/array)

## 1.1.5 - 2018/07/15

1. update deps and packages performance is compared to
2. remove node 9, add node 10
3. new performance run on node 10.6.0 with newest package versions

## 1.1.4 - 2018/02/05

1. update deps
2. update node version tests on Travis
3. update mocha args (replace --compilers with --require)
4. new performance run on node 8.9.4 with newest package versions

## 1.1.3 - 2017/05/31

1. doh. forgot to add two new benchmark comparison implementations to the README list.

## 1.1.2 - 2017/05/31

1. switch benchmark script to JS
2. add two more implementations to the benchmark for comparison
3. rerun benchmark with 2 more implementations and update screenshot of results
4. add node 8 to Travis CI and our test scripts
5. update deps for optimization testing because node 8 changed `GetOptimizationStatus` to use a bit mask instead of a single value
6. add a `package-lock.json` because I'm using npm version 5

## 1.1.1 - 2017/04/30

1. remembered to update the performance screenshot
2. changed package description to match the README's one-liner

## 1.1.0 - 2017/04/30

1. update README with more explicit instructions to wrap an array to preserve it
2. update README to mention empty arrays are okay
3. add benchmark input with empty array
4. add test with empty inner arrays
5. update to handle empty inner arrays
6. add test to ensure inner arrays are preserved (unchanged)
7. update to remove the `(i, 1)` values prepended on the inner arrays via `splice()`
8. rename benchmark input for this library so it's sorted first, again


## 1.0.1 - 2017/04/23

1. add more implementations to compare to
2. display this library's implementation name as the npm package name
3. use custom `benchmarked` to allow formatting output with color
4. update performance screenshot with new results
5. update README with new info

## 1.0.0 - 2017/04/23

1. initial working version with tests, 100% code coverage, and performance benchmarking.
