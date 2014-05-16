linterPath = atom.packages.getLoadedPackage("linter").path
Linter = require "#{linterPath}/lib/linter"

class LinterJavac extends Linter
  # The syntax that the linter handles. May be a string or
  # list/tuple of strings. Names should be all lowercase.
  # TODO: add other java-sources, too
  @syntax: ['source.java']

  # A string, list, tuple or callable that returns a string, list or tuple,
  # containing the command line (with arguments) used to lint.
  cmd: 'javac -Xlint:all'
  #cmd: 'php -l -n -d display_errors=On -d log_errors=Off'

  executablePath: null

  linterName: 'javac'

  # A regex pattern used to extract information from the executable's output.
  regex: '(?<line>\d+): (?<error>error): (?<message>.+)\n.+\n(?<near>[\^\s]+)'

  constructor: (editor) ->
    super(editor)

    atom.config.observe 'linter-javac.javaExecutablePath', =>
      @executablePath = atom.config.get 'linter-javac.javaExecutablePath'

  destroy: ->
    atom.config.unobserve 'linter-javac.javaExecutablePath'

  createMessage: (match) ->
    # message might be empty, we have to supply a value
    if match and match.type == 'parse' and not match.message
      message = 'parse error'
    super(match)

module.exports = LinterJavac
