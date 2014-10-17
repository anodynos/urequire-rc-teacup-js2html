_ = (_B = require 'uberscore')._
prettify = _B.Logger.prettify
isFileIn = require 'is_file_in'

module.exports = [
    '~>teacup-js2html'

    ['**/*.teacup']

    (m)->

      # determine the single args array matching this module
      # throw if more than 1 is found
      args = []
      if @options.args
        if _.isArray @options.args
          args = @options.args
        else if _B.isHash @options.args
          for isFileInOrLabel, argsArrayOrObject of @options.args
            if _.isArray argsArrayOrObject
              isFileInSpec = isFileInOrLabel
              argsArray = argsArrayOrObject
            else
              if _B.isHash argsArrayOrObject
                isFileInSpec = argsArrayOrObject.isFileIn
                argsArray = argsArrayOrObject.args
              else
                throw new Error "teacup-js2html RC: unknown args [] or {isFileIn, args} for module '#{m.path}': #{prettify argsArrayOrObject}"

            if isFileIn m.path, isFileInSpec
              if _.isEmpty args
                args = argsArray
                argsMatchedIsFileInSpecs = isFileInSpec
              else
                throw new Error """
                  teacup-js2html RC: Multiple args matched is_file_in specs for module '#{m.path}'
                  1. isFileIn spec: #{prettify argsMatchedIsFileInSpecs}, args #{prettify args}
                  2. isFileIn spec: #{prettify isFileInSpec}, args #{prettify argsArray}
                      ... might have more...
                """
      # actually call the function exported by the .js module (the actual template) with args
      # m.requireClean() makes sure its flushed from cache first.
      html = m.requireClean(m.dstRealpath).apply null, args
      # delete the '.js' ?
      m.clean m.dstFilepath if @options.deleteJs

      html

    '.html'
]