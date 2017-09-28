context("Data check")

test_that("data objects are unchanged", {
  expect_equal_to_reference(auto17, "auto17.Rdata")
  expect_equal_to_reference(gss16, "gss16.RData")
  expect_equal_to_reference(gss16_Miss, "gss16_Miss.RData")
  expect_equal_to_reference(kerrich, "kerrich.RData")
})
