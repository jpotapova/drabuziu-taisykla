DrabuziuTaisykla =

  init: ->

    mq = window.matchMedia "(max-width: 667px)"

    DrabuziuTaisykla.header mq

    mq.addListener(
      (m) ->
        DrabuziuTaisykla.header m
    )

  header: (m) ->
    if m.matches
      $(window).bind(
        'scroll'
        (e) ->
          if document.body.scrollTop <= 0
            $('body').removeClass 'scrolled'
          else
            $('body').addClass 'scrolled'
      )
    else
      $(window).unbind 'scroll'

DrabuziuTaisykla.init()
