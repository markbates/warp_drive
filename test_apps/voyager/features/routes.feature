Feature: Routing
  In order to use custom routing from a warp drive consumer
  We should be able to define a route in the client app and have that override the warp drive routing

  Scenario: Visiting a page define in the client routes
    When I go to "the foo page"
    Then I should see "foo"
