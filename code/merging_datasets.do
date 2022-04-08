*** Combining/merging datasets ***
// In order to be able to demonstrate knowledge of data combining/merging, I will first split my single dataset into two (by keeping certain variables and dropping rest on each and saving separately). Then I will merge them back together to achieve the same dataset I had in the beginning. 

import delimited "data/raw/listings.csv", bindquotes(strict) encoding("utf-8")clear
// Drop first half of the variables of original dataset
 keep id-host_since
 save "data/raw/listings_part1.dta"

import delimited "data/raw/listings.csv", bindquotes(strict) encoding("utf-8")clear
// Drop second half of the variables of original dataset
keep id host_location-reviews_per_month
save "data/raw/listings_part2.dta"

//Combine datasets part 1 and part 2 to achieve the original dataset
use "data/raw/listings_part1.dta", clear
merge m:1 id using "data/raw/listings_part2.dta"
mkdir data/derived
save "data/derived/listings_merged.dta"
