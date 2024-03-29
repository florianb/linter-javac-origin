{exec, child} = require 'child_process'
linterPath = atom.packages.getLoadedPackage("linter").path
Linter = require "#{linterPath}/lib/linter"

class LinterJavac extends Linter
  # The syntax that the linter handles. May be a string or
  # list/tuple of strings. Names should be all lowercase.
  # TODO: research if there are other java resources must be added
  @syntax: 'source.java'

  # A string, list, tuple or callable that returns a string, list or tuple,
  # containing the command line (with arguments) used to lint.
  cmd: 'javac -Xlint:all'

  linterName: 'javac'

  # A regex pattern used to extract information from the executable's output.
  regex: 'java:(?<line>\\d+): (?<error>error): (?<message>.+)\\n'

  constructor: (editor) ->
    super(editor)

    atom.config.observe 'linter-javac.javaExecutablePath', =>
      @executablePath = atom.config.get 'linter-javac.javaExecutablePath'

  destroy: ->
    atom.config.unobserve 'linter-javac.javaExecutablePath'

  lintFile: (filePath, callback) ->
    console.log 'linter: run javac-linter command'
    exec @getCmd(filePath), {cwd: @cwd}, (error, stdout, stderr) =>
      if stderr # hell yeah - javac spits its error-messages to the stderr.. >:)
        @processMessage(stderr, callback)

module.exports = LinterJavac
