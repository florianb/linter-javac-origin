# linter-javac
=========================

This package will lint your `.java` opened files in Atom through [javac](http://docs.oracle.com/javase/7/docs/technotes/tools/windows/javac.html).

## Installation

* Install [java](http://www.java.com/).
* `$ apm install linter` (if you don't have [AtomLinter/Linter](https://github.com/AtomLinter/Linter) installed).
* `$ apm install linter-javac`

## Settings
You can configure linter-javac by editing ~/.atom/config.cson (choose Open Your Config in Atom menu):
```
'linter-javacs':
  'javaExecutablePath': null # java path. run 'which javac' to find the path
```
## Other available linters
- [linter-phpcs](https://atom.io/packages/linter-phpcs) - Linter plugin for PHP, using phpcs.
- [linter-phpmd](https://atom.io/packages/linter-phpmd) - Linter plugin for PHP, using phpmd.
- [linter-jshint](https://atom.io/packages/linter-jshint) - Linter plugin for JavaScript, using jshint.
- [linter-scss-lint](https://atom.io/packages/linter-scss-lint) - Sass Linter plugin for SCSS, using scss-lint.
- [linter-coffeelint](https://atom.io/packages/linter-coffeelint) Linter plugin for CoffeeScript, using coffeelint.
- [linter-csslint](https://atom.io/packages/linter-csslint) Linter plugin for CSS, using csslint.
- [linter-rubocop](https://atom.io/packages/linter-rubocop) - Linter plugin for Ruby, using rubocop.
- [linter-tslint](https://atom.io/packages/linter-tslint) Linter plugin for JavaScript, using tslint.
