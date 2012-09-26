library('rjags')

# create the data to be sent to R (using the same as class example):
data <- source('data.txt')$value

# now to send the model and data to JAGS:
# if you need to navigate to the place you saved your .bug file, now is the time to do it.
m = jags.model(file="outliers.txt", data=data)

# this will create a BUGS object in R. Now you can do some runs...
update(m, 10000) # I found it runs really quickly...

# finally, get the samples from JAGS:
draw = coda.samples(m, 10000, thin=1, variable.names = c("beta0", "beta1", "bad_fraction", "log_sig_good", "log_sig_bad"))

# and get a pretty picture and summary stats:
#plot(draw); summary(draw)

samples <- as.matrix(draw)

