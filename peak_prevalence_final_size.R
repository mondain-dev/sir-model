library(lamW)
library(ggplot2)

R0   = seq(1,5,0.01)                  # R_0
P    = 1-(1+log(R0))/R0               # peak prevalence
eta  = lambertW0(-exp(-R0)*R0)/R0 + 1 # solving 1 − eta = x_0 exp(−R_0.eta) with x_0 ~ 1.0
data = data.frame(cbind(R0,P,eta))

# plot peak prevalence and final outbreak size
ggplot(data, aes(x=P, y=eta, color=R0)) + geom_point() + scale_color_gradient(low="blue", high="red", name=expression(R[0])) + xlab(expression(I[d]^{max} ~ "(peak prevalence)")) + ylab(expression(eta ~ "(final size)"))

# 2 <= R_0 <= 3
ggplot(subset(data, R0 >= 2 & R0 <=3), aes(x=P, y=eta, color=R0)) + geom_point() + scale_color_gradient(low="blue", high="red", name=expression(R[0])) + xlab(expression(I[d]^{max} ~ "(peak prevalence)")) + ylab(expression(eta ~ "(final size)"))
