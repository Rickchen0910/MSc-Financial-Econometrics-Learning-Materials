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

tsline gs_adjclose jpm_adjclose,lpattern("-" "_")

g log_gs_adjclose = log(gs_adjclose) 

g dlog_gs_adjclose = d.log_gs_adjclose

g log_jpm_adjclose = log(jpm_adjclose) 

g dlog_jpm_adjclose = d.log_jpm_adjclose

varsoc dlog_gs_adjclose dlog_jpm_adjclose,maxlag(12)

var dlog_gs_adjclose dlog_jpm_adjclose,lags(1/5)

varstable,graph

varlmar

varnorm

vargranger

irf create adjclose,set(workshop4) step(20)

irf graph irf,yline(0) noci
irf table irf, noci


irf graph oirf,yline(0) noci
irf table oirf,noci

irf graph fevd, r(dlog_gs_adjclose)noci
irf table fevd, r(dlog_gs_adjclose)noci

irf graph fevd, r(dlog_jpm_adjclose)noci
irf table fevd, r(dlog_jpm_adjclose)noci

irf graph fevd
irf table fevd
