bad_drivers <- read.csv("/Users/stephaniefissel/Desktop/ds 2003/bad-drivers.csv")
bad_drivers

bad_drivers1 <- subset(bad_drivers, select = -c(Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Speeding,
                                                Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Alcohol.Impaired,
                                                Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Not.Distracted,
                                                Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Had.Not.Been.Involved.In.Any.Previous.Accidents))

colnames(bad_drivers1)[2] ="Number of Drivers Involved in Fatal Collisions per Billion Miles"
colnames(bad_drivers1)[3] ="Car Insurance Premiums"
colnames(bad_drivers1)[4] ="Losses Incurred by Insurance Companies for Collisions per Insured Driver"

#descriptive statistics
install.packages("vtable")
library(vtable)
st(bad_drivers1)

#boxplots
boxplot(bad_drivers$Number.of.drivers.involved.in.fatal.collisions.per.billion.miles,
        main = "Number of Drivers Involved in Fatal Collisions per Billion Miles")
boxplot(bad_drivers$Car.Insurance.Premiums....,
        main = "Car Insurance Premiums")
boxplot(bad_drivers$Losses.incurred.by.insurance.companies.for.collisions.per.insured.driver....,
        main = "Losses Incurred by Insurance Companies for Collisions per Insured Driver")
