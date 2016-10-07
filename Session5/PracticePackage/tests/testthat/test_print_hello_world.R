# Tell R what you are testing
context("print_hello_world.R")

#A test function
test_that("Outputs the correct thing.",{
  expect_match(print_hello_world(), "Hello World.")
})
