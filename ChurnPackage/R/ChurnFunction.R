ChurnFunction <- function(x,y) {
  if(any(y==x)){
    churn_probability <- glm(Exited ~ CreditScore+Gender+Age+Tenure+Balance+NumOfProducts+HasCrCard+IsActiveMember+EstimatedSalary, data = customer_personal, family = "binomial")
    y <- y[,PredChurn := predict(churn_probability,type="response")]
    result <- y[CustomerId==x, PredChurn]
    return(result)
  }else{
    stop("CustomerId does not exist")
  }
}
