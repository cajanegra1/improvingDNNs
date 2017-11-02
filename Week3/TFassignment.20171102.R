sigmoid <- function(x) {
              1/(1+exp(-x))
            }

# logits = sigmoid(np.array([0.2,0.4,0.7,0.9]))
# cost = cost(logits, np.array([0,0,1,1]))
predictions <- c(0.2, 0.4, 0.7, 0.9)
labels <- c(0, 0, 1, 1)
logits <- sigmoid(predictions)
# [1] 0.5498340 0.5986877 0.6681878 0.7109495

# will prove that what the TF notebook is doing is computing the sigmoid on the
# logits vector and then computing the cross-entropy.
CEvect <- -labels*log(predictions) - (1-labels)*log(1-predictions)
# [1] -0.2231436 -0.5108256 -0.3566749 -0.1053605
# that's not the expected output.
CEvect <- -labels*log(logits) - (1-labels)*log(1-logits)
# [1] -0.7981389 -0.9130153 -0.4031860 -0.3411539
# not the expected output either.
CEvect <- -labels*log(sigmoid(logits)) - (1-labels)*log(1-sigmoid(logits))
# => that's what they posted on the notebook as the expected output.
