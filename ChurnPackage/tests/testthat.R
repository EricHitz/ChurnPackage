library(testthat)
library(ChurnPackage)

customer <- fread("data_customer.csv")
personal <- fread("data_personal.csv")
customer_personal <- merge(customer,personal,by="CustomerId",all=TRUE)

test_that("ChurnFunction Test",{
  expect_true(ChurnFunction(15653251,customer_personal)>ChurnFunction(15662641,customer_personal))
})


