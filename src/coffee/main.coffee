DrabuziuTaisykla =

  init: ->

    # remove no-js class from html to indicate js was detected
    top.document.getElementsByTagName('html')[0].classname = ''

    body = document.body

    window.onscroll =
      (e) ->

        if body.scrollTop <= 0
          # when at the top - remove class scrolled
          body.className = ''
        else
          # when not at the very top - add class scrolled
          body.className = 'scrolled'

DrabuziuTaisykla.init()
