*** data_cleaning ***

// Keep only the variables that are of interest for our analysis
keep host_is_superhost host_verifications host_has_profile_pic city property_type room_type bedrooms prc_EUR number_of_reviews

// Shortening variable names and labeling variables
label var prc_EUR "Daily price of accomodation (in euros)"
rename host_is_superhost superhost
label variable superhost "True/False on whether the host is superhost or not"
rename host_verifications host_ver
label var host_ver "Info on types of verifications by host(i.e. email, facebook, phone)"
rename host_has_profile_pic hostpp
label var hostpp "Binary on whether host has profile picture on app or not"
label var city "City of the property"
label var property_type "Type of property"
label var room_type "Type of the room (i.e. private, shared, entire home)"
label var bedrooms "Number of bedrooms"


// Filtering and observing variables
summarize prc_EUR if city == "London"
describe city, detail
codebook city
display missing("London")
count if city == "London" & !missing(city)

// Automate the repeating task of dropping missing observations from variables 
foreach var in host_is_superhost host_verifications host_has_profile_pic city property_type room_type bedrooms prc_EUR number_of_reviews {
drop if missing("`var'")
}
display missing(bedrooms)
display missing(.)
display missing("")


// save data
save "data/derived/listings_clean.dta", replace
