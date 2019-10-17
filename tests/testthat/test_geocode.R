context("geocode_func")
##Testing the package


test_that("Overall test",{expect_that(round(as.numeric(geocode("London")$getCoordinate()[1,"lat"]),2),equals(51.51))
  expect_that(round(as.numeric(geocode("london,uk")$getCoordinate()["lon"]),2),equals(-0.13))
  expect_error(geocode("")$getCoordinate(),"try again")
  expect_error(geocode(123)$getCoordinate(),"try again")
  expect_error(geocode()$getCoordinate(),"argument \"input\" is missing, with no default")
  expect_error(geocode("sdfdf @@@ ~~!!")$getCoordinate(),"city not found")
})

