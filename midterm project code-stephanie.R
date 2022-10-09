bad_drivers <- read.csv("/Users/stephaniefissel/Desktop/ds 2003/bad-drivers.csv")
bad_drivers

#descriptive statistics
install.packages("vtable")
library(vtable)
st(bad_drivers)

#boxplots
boxplot(bad_drivers$Number.of.drivers.involved.in.fatal.collisions.per.billion.miles,
        main = "Number of Drivers Involved in Fatal Collisions per Billion Miles")
boxplot(bad_drivers$Car.Insurance.Premiums....,
        main = "Car Insurance Premiums")
boxplot(bad_drivers$Losses.incurred.by.insurance.companies.for.collisions.per.insured.driver....,
        main = "Losses Incurred by Insurance Companies for Collisions per Insured Driver")
