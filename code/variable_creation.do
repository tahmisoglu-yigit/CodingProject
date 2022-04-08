*** Create variables ***

// Generate dummy variables based on certain string values for use on our regression analysis

generate byte city_london = (city == "London") // Returns the value 1 if the city is London, 0 otherwise
generate byte superhost1 = (superhost == "t") // Returns the value 1 if the host is superhost, 0 otherwise
generate byte hostpp1 = (hostpp == "t") // Returns the value 1 if the host has profile picture, 0 otherwise
generate byte property_type1 = (property_type == "Apartment") // Returns the value 1 if the property type is apartment, 0 otherwise
generate byte room_type1 = (room_type == "Private room") // Returns the value 1 if the room is private room, 0 otherwise
keep if regexm(host_ver , "email|phone|facebook")
egen avg_prc = mean(prc_EUR), by(city)
label var avg_prc "Average daily price of accomodation by city(in EUR)"
egen n_superhost = count(superhost), by(city)
label var n_superhost "Counts the number of superhosts by city"
describe

// Generate variable counting 
egen lndn_prptype = sum(substr(city, 1, 6) == "London"), by( property_type )
label var lndn_prptype "Counts the number of cities that are “London” by property type"

save "data/derived/listings_clean.dta", replace
