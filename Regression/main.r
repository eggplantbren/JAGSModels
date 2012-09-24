library('rjags')

# create the data to be sent to R (using the same as class example):
data <- source('data.txt')$value

# now to send the model and data to JAGS:
# if you need to navigate to the place you saved your .bug file, now is the time to do it.
m = jags.model(file="model.txt", data=data)

# this will create a BUGS object in R. Now you can do some runs...
update(m, 10000) # I found it runs really quickly...

# finally, get the samples from JAGS:
draw = coda.samples(m, 100000, thin=30, variable.names = c("beta0", "beta1", "sig", "y_new"))

# and get a pretty picture and summary stats:
#plot(draw); summary(draw)

samples <- as.matrix(draw)

