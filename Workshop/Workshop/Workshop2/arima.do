		  *==============================================================
          *          Financial Econometrics for MSc Programme
          *==============================================================

		  * Binzhi Chen
		  * University of Birmingham Business School, Department of Economics
		  * Email: Rickchen0910@163.com

          *==============================================================

use gs.dta,clear

gen date_1 = date(date,"YMD")

g datem = mofd(date_1)

format datem %tm

tsset datem 

graph twoway line gs_adjclose datem, yaxis(1) sort || line jpm_adjclose datem, yaxis(2) sort
graph twoway connected gs_adjclose datem,yaxis(1)|| connected jpm_adjclose datem, yaxis(2) sort msymbol(Th)
graph twoway connected gs_adjclose datem, tline(2008m1) yaxis(1) xlabel(,angle(45)) sort msymbol(Dh) || line jpm_adjclose datem, yaxis(2) sort clwidth(vthick) clcolor(eltblue)
dfuller gs_adjclose
dfuller jpm_adjclose

g log_gs_adjclose = log(gs_adjclose) 

g dlog_gs_adjclose = d.log_gs_adjclose

dfuller dlog_gs_adjclose

g log_jpm_adjclose = log(jpm_adjclose) 

g dlog_jpm_adjclose = d.log_jpm_adjclose

dfuller dlog_jpm_adjclose

corrgram dlog_jpm_adjclose,lags(10)
ac dlog_jpm_adjclose,lags(10)
pac dlog_jpm_adjclose,lags(10)

quiet arima dlog_gs_adjclose,arima(1,0,0)
estat ic
est store m1
est describe m1

quiet arima dlog_gs_adjclose,arima(2,0,0)
est store m2

quiet arima dlog_gs_adjclose,arima(0,0,1)
est store m3

quiet arima dlog_gs_adjclose,arima(0,0,2)
est store m4

quiet arima dlog_gs_adjclose,arima(1,0,1)
est store m5

quiet arima dlog_gs_adjclose,arima(1,0,2)
est store m6

quiet arima dlog_gs_adjclose,arima(2,0,1)
est store m7

quiet arima dlog_gs_adjclose,arima(2,0,2)
est store m8

est table m1 m2 m3 m4 m5 m6 m7 m8,stats(aic bic)
