url = 'http://localhost:8080/'

# ------------------------------------------------------------------------------

###

casper.test.begin('On narrow device header is sticky', {

  # prepare narrow device viewport
  setUp: (test) ->
    casper.options.viewportSize = {
      width: '400px'
      height: '400px'
    }

  test: (test) ->

    # open site
    casper.start url

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

###

# ------------------------------------------------------------------------------

casper.test.begin('On wide device header is not sticky', {

    # prepare wide device viewport
    setUp: (test) ->
      casper.options.viewportSize = {
        width: '800px'
        height: '400px'
      }

    test: (test) ->

      # open site
      casper.start url

      ###
      check if .scrolled is not there in the beginning
      scroll down a bit and make sure that .scrolled was not added
      ###
      casper.then(
        () ->
          # header isn't sticky in the beginning
          test.assertDoesntExist '.scrolled'
          casper.waitFor(
            # scroll down a bit
            () ->
              this.page.scrollPosition = {
                top: this.page.scrollPosition.top + 200
                left: 0
              }
              true
            # make sure class 'scrolled' was not added
            () ->
              test.assertDoesntExist '.scrolled'
          )
      )

      casper.run(
        () ->
          test.done()
      )

})
