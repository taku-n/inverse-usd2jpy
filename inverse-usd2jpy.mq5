#property indicator_separate_window

#property indicator_buffers 5
#property indicator_plots   1

#property indicator_label1 "Open;High;Low;Close"
#property indicator_type1  DRAW_COLOR_CANDLES
#property indicator_color1 clrOrangeRed, clrDodgerBlue
#property indicator_style1 STYLE_SOLID
#property indicator_width1 1

input string USDJPY = "USDJPY";  // The symbol name of USDJPY is

double open[];
double high[];
double low[];
double close[];
double clr[];
// buffers

int OnInit()
{
	SetIndexBuffer(0, open,  INDICATOR_DATA);
	SetIndexBuffer(1, high,  INDICATOR_DATA);
	SetIndexBuffer(2, low,   INDICATOR_DATA);
	SetIndexBuffer(3, close, INDICATOR_DATA);
	SetIndexBuffer(4, clr,   INDICATOR_COLOR_INDEX);

	return INIT_SUCCEEDED;
}

int OnCalculate(const int       RATES_TOTAL,
		const int       PREV_CALCULATED,
		const datetime &TIME[],
		const double   &OPEN[],
		const double   &HIGH[],
		const double   &LOW[],
		const double   &CLOSE[],
		const long     &TICK_VOLUME[],
		const long     &VOLUME[],
		const int      &SPREAD[])
{
	int n_usdxxx;
	int n_usdjpy;

	MqlRates a_usdxxx[];
	MqlRates a_usdjpy[];

	n_usdxxx = CopyRates(Symbol(), Period(), 0, Bars(Symbol(), Period()),
			a_usdxxx);
	n_usdjpy = CopyRates(USDJPY, Period(), 0, Bars(USDJPY, Period()),
			a_usdjpy);

	Print("n_usdxxx => ", n_usdxxx);
	Print("n_usdjpy => ", n_usdjpy);

	Print("USDXXX time[0] => ", a_usdxxx[0].time,
			" close[0] => ", a_usdxxx[0].close);
	Print("USDJPY time[0] => ", a_usdjpy[0].time,
			" close[0] => ", a_usdjpy[0].close);

	return RATES_TOTAL;
}
