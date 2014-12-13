DrabuziuTaisykla =

  init: ->

    if window.matchMedia("(max-width: 532px)").matches
      $(window).scroll ->
        if document.body.scrollTop <= 0
          $('body').removeClass 'scrolled'
        else
          $('body').addClass 'scrolled'

DrabuziuTaisykla.init()
