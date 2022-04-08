	*** Summary statistics ***
use "data/derived/listings_clean.dta", replace

tab avg_prc
tab room_type
tab property_type

eststo clear
estpost summarize avg_prc bedrooms 
esttab using "output/summary.doc", noobs label replace title("Summary statistics")
