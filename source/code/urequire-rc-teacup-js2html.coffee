module.exports = [
    '~>teacup-js2html'

    ['**/*.teacup']

    (m)-> # call the function exported by the .js module (the actual template) with @options.args
      html = m.requireClean(m.dstRealpath).apply null, @options.args
      m.clean m.dstFilepath if @options.deleteJs # make sure to delete 'the .js'
      html

    '.html'
]