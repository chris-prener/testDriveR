context("Data check")

test_that("data objects are unchanged", {
  expect_equal_to_reference(stlAsthma, "auto17.Rdata")
  expect_equal_to_reference(stlInsurance, "gss16.RData")
  expect_equal_to_reference(stlLead, "gss16_Miss.RData")
  expect_equal_to_reference(stlMurders, "kerrich.RData")
})
