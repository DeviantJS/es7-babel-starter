## ES7 - Babel Library Boilerplate
> &nbsp;&nbsp;**Build Status (#master):** &nbsp;&nbsp;[![CircleCI](https://circleci.com/gh/DeviantJS/es7-babel-starter.svg?style=svg)](https://circleci.com/gh/DeviantJS/es7-babel-starter)

> &nbsp;&nbsp;**Coverage (#master):** &nbsp;&nbsp;[![codecov](https://codecov.io/gh/DeviantJS/es7-babel-starter/branch/master/graph/badge.svg)](https://codecov.io/gh/DeviantJS/es7-babel-starter)

> &nbsp;&nbsp;**Code Quality Score:** &nbsp;&nbsp;[![Code Climate](https://codeclimate.com/github/DeviantJS/es7-babel-starter/badges/gpa.svg)](https://codeclimate.com/github/DeviantJS/es7-babel-starter)

> &nbsp;&nbsp;**Code Issues:** &nbsp;&nbsp;[![Issue Count](https://codeclimate.com/github/DeviantJS/es7-babel-starter/badges/issue_count.svg)](https://codeclimate.com/github/DeviantJS/es7-babel-starter)

- [Development Experience](#development-experience)
- [Usage](#usage)
- [Testing](#testing)
- [Performance Benchmarks](#benchmarking-suite)
- [Debugging](#debugging)

### Development Experience
- ES6 / ES7 transpilation with [Babel](https://github.com/babel/babel)
- ES6+ minification with Babili [babili](https://github.com/babel/babili)
- ES6+ Testing via [babel-register](https://github.com/babel/babel/tree/master/packages/babel-register) with [Mocha](https://github.com/mochajs/mocha) & [Chai](https://github.com/chaijs/chai)
- HTML Test Reports via [mochawesome](https://github.com/adamgruber/mochawesome)
- Code Linting with [ESLint](https://github.com/eslint/eslint)
- Benchmark Testing with [benchmark.js](https://github.com/bestiejs/benchmark.js)
- Code monitoring and auto server restart with [nodemon](https://github.com/remy/nodemon)
- Debugging with [babel-node-debug](https://github.com/crabdude/babel-node-debug)
- Security vulnerability scan with [nsp](https://github.com/nodesecurity/nsp)
- Docker build for non-lib projects.

### Usage

- `npm start` - execute code in `src` directory with live reload via `nodemon` transpiled with `babel-node`
- `npm run serve:dev <target>` - execute target code with live reload via `nodemon` transpiled with `babel-node`
- `npm run debug src` - execute code with debug flag enabled
- `npm run benchmark` - run benchmark tests with `benchmark.js`
- `npm run benchmark:watch` - run benchmark tests with `benchmark.js` and watch for file changes
- `npm run lint` - code linting with `eslint`
- `npm run lint:fix` - fix problems automatically with `eslint`
- `npm test` - run tests with `mocha` and `chai` with spec as reporter and `nyc` code coverage
- `npm run test:watch` - run tests with `mocha` and `chai` and watch for changes
- `npm run test:reporter-list` - run tests with `mocha` and `chai` with `list` reporter
- `npm run test:export` - export tests results as html files in the `./reports` folder via `mochasome`
- `npm run build:dist` - transpile and minify ES6+ code and create sourcemaps with `babel` & `babili`
- `npm run serve:dist` - serve production files from the `./dist` folder via `node`
- `npm run scan:security` - run vulnerability tests via the node security platform `nsp`
- `npm run scan:updates` - check for latest versions of dependencies via `ncu`

### Testing

_Testing with [Mocha](https://github.com/mochajs/mocha) and [Chai](https://github.com/chaijs/chai), HTML Reports via [mochawesome](https://github.com/adamgruber/mochawesome)_

```bash
npm test

```

### Benchmarking Suite

_Benchmark Testing with [Benchmark.js](https://github.com/bestiejs/benchmark.js)_

```bash
npm run benchmark

```

### Debugging

Currently a known issues in [node-inspector/](https://github.com/node-inspector/node-inspector/). in current Version 0.12.8 [here](https://github.com/node-inspector/node-inspector/issues/905) prevents use with Node Version 6x.

Current debug workaround for node 6.x:

- `"debug": "nodemon $2 --exec babel-node --debug",`

When issues is resolved or on version 4.x / 5.x:

- `"debug": "babel-node-debug $2",`

and run it via ...

```bash
npm run debug src

```

### Security & Updates

_Run vulnerability tests via `Node Security Project`_

_Check for dependency updates via `NPM Check Updates`_