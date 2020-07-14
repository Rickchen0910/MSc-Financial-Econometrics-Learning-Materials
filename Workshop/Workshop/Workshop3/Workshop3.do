		  *==============================================================
          *          Financial Econometrics for MSc Programme
          *==============================================================

		  * Binzhi Chen
		  * University of Birmingham Business School, Department of Economics
		  * Email: Rickchen0910@163.com

          *==============================================================



ssc install kpss

use Workshop3.dta,clear

g datem = monthly(date,"YM")

format datem %tm

tsset datem

graph twoway line gdpdef datem, yaxis(1) || line nzcarreg datem, yaxis(2) 

display 12 * (180/100)^(1/4) //Schwert Maximum lag order method

dfuller gdpdef  

dfuller gdpdef,lags(12) reg 

dfuller gdpdef,lags(9) reg

kpss gdpdef, auto 

g log_gdpdef = log(gdpdef)

g dlog_gdpdef = d.log_gdpdef

dfuller dlog_gdpdef
    

dfuller dlog_gdpdef,lags(12) reg 
dfuller dlog_gdpdef,lags(8) reg 

kpss dlog_gdpdef,auto 

    g log_nzcarreg = log(nzcarreg)

    g trend = _n

    reg log_gdpdef log_nzcarreg trend

    estat dwatson


