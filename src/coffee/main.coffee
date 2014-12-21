DrabuziuTaisykla =

  init: ->

    ###
    Define circumstances when special mobile header behaviour
    should be triggered
    ###

    mq = window.matchMedia "(max-width: 667px)"

    DrabuziuTaisykla.header mq

    mq.addListener(
      (m) ->
        DrabuziuTaisykla.header m
    )

  header: (m) ->

    ###
    On mobile device when scrolling down,
    hide intro text and leave navigation always visible
    ###

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
