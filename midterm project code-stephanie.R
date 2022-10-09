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


# What states have the highest number of car accidents and car insurance premiums?
# x-axis: state
# y-axis: number of car accidents
#more rural states
  #can do more research into that

ggplot(bad_drivers,              
       aes(x = reorder(State, -Number.of.drivers.involved.in.fatal.collisions.per.billion.miles),
           y = Number.of.drivers.involved.in.fatal.collisions.per.billion.miles)) +       
  geom_bar(stat= "identity", color='blue', fill='blue', width=0.7, position=position_dodge(width=0.5)) +
  ggtitle("Accidents per State") +
  labs(y="Number of Drivers Involved in Fatal Collisions Per Billion Miles",
       x="State") +
  theme(
    plot.title=element_text(color="blue", size=12, hjust=0.5, face="bold"),
    axis.text.x=element_text(angle=45, hjust=1, size=8, color="black"),
    axis.title.y=element_text(size=9, color="black")
  )

rural <- read.csv("/Users/stephaniefissel/Desktop/ds 2003/ruralpopulation.csv")
rural
ggplot(rural,
       aes(x = reorder(State, -Index),
           y = Rural_percent)) +
  geom_bar(stat= "identity", color='coral', fill='coral', width=0.7, position=position_dodge(width=0.5)) +
  ggtitle("Rural States") +
  labs(y="Rural Percentage",
       x="State") +
  theme(
    plot.title=element_text(color="coral3", size=12, hjust=0.5, face="bold"),
    axis.text.x=element_text(angle=45, hjust=1, size=8, color="black"),
    axis.title.y=element_text(size=9, color="black")
  )

library(dplyr)
df= bad_drivers %>% inner_join(rural,by="State")
df

ggplot(df,
      aes(x = Number.of.drivers.involved.in.fatal.collisions.per.billion.miles,           
           y = Rural_percent)) +
  ggtitle("Rural Vs. number accidents") +
  labs(y="rural percent",
       x="number accidents") +
  geom_point() +
  geom_smooth(method=lm, level=0) +
  theme(
    plot.title=element_text(color="blue", size=14, hjust=0.5, face="bold"),
    axis.text.x=element_text(hjust=0.5, size=9, color="black"),
    axis.title.y=element_text(size=9, color="black"))


# Is there a relationship between losses and insurance premiums?
  #Yes, there is a positive moderate linear relationship
ggplot(bad_drivers,               
       aes(x = Losses.incurred.by.insurance.companies.for.collisions.per.insured.driver....,           
           y = Car.Insurance.Premiums....)) +
  ggtitle("Losses Vs. Insurance Premiums") +
  labs(y="Car Insurance Premiums",
       x="Losses Incurred by Insurance Companies for Collisions Per Insured Driver") +
  geom_point() +
  geom_smooth(method=lm, level=0) +
  theme(
    plot.title=element_text(color="blue", size=14, hjust=0.5, face="bold"),
    axis.text.x=element_text(hjust=0.5, size=9, color="black"),
    axis.title.y=element_text(size=9, color="black"))
  
    
