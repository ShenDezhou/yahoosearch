Shell = require 'shell'

module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', 'yahoosearch:yahoo-it': => @search()

  search: ->
    editor = atom.workspace.getActiveTextEditor()
    buffer = editor.getBuffer()
    selections = editor.getSelections()

    buffer.transact ->
      for selection in selections
        cased = selection.getText()
        url = "https://search.yahoo.com/search?p=#{cased}"
        Shell.openExternal url
