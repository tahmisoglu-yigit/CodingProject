    *** Transform data *** 

// Import the merged data (which is same as the original dataset)
use "data/derived/listings_merged.dta", clear

describe
// Price is a string variable. Destring it into float variable 
generate prc = real(substr(price, 2, 4))

// and convert its currency from USD to EUR for future analysis purposes
replace prc = prc * 0.92
rename prc prc_EUR

// dropping the missing observations
drop if missing(prc_EUR)
drop if host_response_time == "N/A"

save "data/derived/listings_merged.dta", replace
