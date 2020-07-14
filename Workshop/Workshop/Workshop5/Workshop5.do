		  *==============================================================
          *          Financial Econometrics for MSc Programme
          *==============================================================

		  * Binzhi Chen
		  * University of Birmingham Business School, Department of Economics
		  * Email: Rickchen0910@163.com

          *==============================================================


use http://www.stata-press.com/data/r15/balance2,clear

tsset t

tw line c i y t, sort title("Graphic Analysis") ///
note("Source:http://www.stata-press.com/data/r15/balance2") 

varsoc y i c, maxlag(12)

vecrank y i c, lags(3) level99

vec y i c, lags(3) rank(1)

veclmar

vecstable,graph
