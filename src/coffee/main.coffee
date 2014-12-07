DrabuziuTaisykla =

  init:

    $(window).scroll ->
      if document.body.scrollTop is 0
        $('body').removeClass 'scrolled'
      else
        $('body').addClass 'scrolled'
