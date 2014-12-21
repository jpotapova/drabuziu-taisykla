url = 'http://localhost:8080/'

# ------------------------------------------------------------------------------

casper.test.begin('Header is sticky on narrow devices', {

  setUp: (test) ->
    # open site
    casper.start url

  test: (test) ->

    # check .scrolled isn't there, scroll down, make sure .scrolled is there
    casper.then(
      () ->
        test.assertDoesntExist '.scrolled' # header isnt sticky in the beginning
        casper.waitFor(
          # scrolling down
          () ->
            this.page.scrollPosition = {
              top: this.page.scrollPosition.top + 200
              left: 0
            }
            true
          # checking if .scroller is there on body tag
          () ->
            test.assertExists 'body.scrolled'
        )

    )

    # scroll back to top and make sure .scrolled is removed from body
    casper.then(
      () ->
        casper.waitFor(
          # scroll back to top
          () ->
            this.page.scrollPosition = {
              top: 0
              left: 0
            }
            true
          # is .scrolled removed now?
          () ->
            test.assertDoesntExist '.scrolled'
        )

    )

    casper.run(
      () ->
        test.done()
    )
})
