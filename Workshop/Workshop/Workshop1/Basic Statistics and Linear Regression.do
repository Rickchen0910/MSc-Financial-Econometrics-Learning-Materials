

          *==============================================================
          *          Financial Econometrics for MSc Programme
          *==============================================================

		  * Binzhi Chen
		  * University of Birmingham Business School, Department of Economics
		  * Email: Rickchen0910@163.com

          *==============================================================



use nerlove63.dta //open the data file

label data "Returns to scale in electricity supply, Nerlove, 1963" //set labels for the whole dataset

help describe //check the details of the code

describe //or you can use d instead

list totcost in 1/5 //select the head of the dataset

summarize totcost //decriptive analysis or you can use su instead

summarize totcost,detail //more details of descriptive analysis

return list 

display "The coefficient of variation is" r(sd) / r(mean)

pwcorr totcost output plabor,sig star(.05) //pairwise correlation put stars for the correlation at 95% significance level

histogram totcost,frequency //show the graph for the variable. y-axis is the frequency

scatter totcost output//scatter plot
scatter totcost output,mcolor(maroon) //scatter plot
scatter totcost output,msymbol(sh) //scatter plot

generate n =_n //_n stands for observation n

scatter totcost output,mlabel(n) mlabpo(6) 

scatter totcost output,mlabel(n) mlabpo(6) yline(55,lwidth(thin) lcolor(black) lpattern(dash))

twoway (sc totcost output) (lfit totcost output)

twoway (lfitci totcost output) (scatter totcost output)

gener lntc = log(totcost)
gener lnq = log(output)
gener lnpl = log(plabor) 
gener lnpf = log(pfuel)
gener lnpk = log(pkap)

reg lntc lnq lnpl lnpf lnpk //linear regression

vce //variance covariance matrix estimation

test lnq=1

test (lnq=1)(lnpl+lnpf+lnpk=1)

ereturn list

reg lntc lnq lnpl lnpf lnpk, noc//linear regrassion without constant

constraint def 1 lnpl+lnpf+lnpk=1 //define constraint

cnsreg lntc lnq lnpl lnpf lnpk, c(1) //constrained regression


