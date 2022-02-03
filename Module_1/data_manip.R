# Navigate to a directory that contains Module_1 and Fish_data
# Have them create a sym link so that paths are the same
# in the dataset, I changed some Coho to COHO, split into 2 csvs, and deleted a few rows from
#     each csv file - different rows in each so they won't totally match

setwd("../Fish_data/Modified_for_tutorials/")

# Read in the data
body <- read.csv("Fish_body_size.csv")
iso <- read.csv("Fish_isotopes.csv")


# some quick looks at this
head(body)
head(iso)

tail(body)

summary(as.factor(body$Species))

unique(body$Species)


# Some subsetting

body[body$Species=="Coho",]
body[body$Species %in% c("Coho", "Pink"),]


# Correct the COHO with coho
body$Species <- gsub("COHO", "Coho", body$Species)

unique(body$Species)
summary(as.factor(body$Species))

#alternately
body <- read.csv("Fish_body_size.csv")
body$Species[body$Species=="COHO"] <- "Coho"


unique(body$Species)
summary(as.factor(body$Species))


# Other corrections
body$Species <- gsub("Dolly", "Dolly varden", body$Species)
body$Species <- gsub("Steelhesd", "Steelhead", body$Species)

summary(as.factor(body$Species))
length(unique(body$Species))

unique(body$Site)
sort(unique(body$Site))

body$Site <- gsub("RT02-R", "RT02R", body$Site)
sort(unique(body$Site))


# merge the datasets together
dim(body)
dim(iso)

which(!body$Fish.code %in% iso$Fish.code)
body$Fish.code[which(!body$Fish.code %in% iso$Fish.code)]

iso$Fish.code[which(!iso$Fish.code %in% body$Fish.code)]

# slow way
in_both <- intersect(iso$Fish.code, body$Fish.code)
in_both

iso_red <- iso[iso$Fish.code %in% in_both, ]
body_red <- body[body$Fish.code %in% in_both, ]
dim(iso_red)
dim(body_red)

all_data1 <- cbind(body_red, iso_red)
head(all_data1)
all_data2 <- all_data1[,-7]
head(all_data2)
dim(all_data2)

# combine using merge
?merge
all_data <- merge(body, iso)
head(all_data)
dim(all_data)

write.csv("./Fish_data/Modified/fish_data_combined.csv")



# Demonstrate some filtering on values - don't need to actually modify the dataset







