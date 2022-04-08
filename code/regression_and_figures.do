*** Regression output & graphs ***

// Create directory for results to be saved
mkdir output

// OLS
reg avg_prc city_london property_type1 room_type1 bedrooms if bedrooms > 2 
estimates store OLS1
outreg2[OLS1] using "output\OLS1.doc", replace ctitle(No host specifications)
reg avg_prc city_london property_type1 room_type1 bedrooms superhost1 hostpp1 if bedrooms > 2
estimates store OLS1
outreg2[OLS1] using "output\OLS1.doc", append ctitle(With host specifications)

// Graphs

* Daily price by number of bedrooms
graph bar prc_EUR, over(bedrooms)
graph export "output\price by bedrooms.pdf

* Scatterplot average daily price by private room
scatter avg_prc room_type1
graph export "output\price by room type.png"
