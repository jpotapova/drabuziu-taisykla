DrabuziuTaisykla =

  init: ->

    $('html').removeClass 'no-js'

    $(window).bind(
      'scroll'
      (e) ->
        if document.body.scrollTop <= 0
          $('body').removeClass 'scrolled'
        else
          $('body').addClass 'scrolled'
    )

DrabuziuTaisykla.init()
