DrabuziuTaisykla =

  init:

    $(window).scroll ->
      if document.body.scrollTop <= 0
        $('body').removeClass 'scrolled'
      else
        $('body').addClass 'scrolled'
