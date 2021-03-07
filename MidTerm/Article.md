# Pricing American Options with Random Walks

**Minerva Schools at KGI**

**IL.181-International Money and Finance Prof. Mathur**

**Spring 2021**

<div style="page-break-after: always;"></div>

Random walks are used in finance to price options in a way that takes into account the volatility of the stock market. However, the simple model based on the Black Scholes model is only applicable for European options, those with only one exercise date. To extend upon this, we approach calculating American option by looking at issues of using either brute force or perfect foresight to price Bermuda options. Finishing off, we price American options using the Longstaff Schwartz algorithm (2001). 

## Pricing European Options

  When we calculate the price of an option, we simulate possible values at the end of the maturity by randomly moving the stock price up or down in discrete time intervals using the formula (Shonkwiler & Mendivil, 2009): 


<img src="https://latex.codecogs.com/svg.latex?\Large&space;\frac{dS}{S}=\mu*dt+\sigma*\sqrt{dt}N" title="\frac{dS}{S}=\mu*dt+\sigma*\sqrt{dt}N" />


  where S is the price of the asset, μ is the growth rate of the stock and σ is the volatility of the stock. For the sake of the discussion, we assume the growth rate to be zero. The python code below shows a simple simulation that is coded up using object-oriented programming. Figure 1 shows an example of ten walks from the 1000 walks that were simulated. All the stocks that have a final price above the strike price are “in the money” and one should execute the option at the end of the maturity. 

![image](https://github.com/Halkenhaeusser/International-Money-and-Finance/blob/main/MidTerm/basic_plot.jpg)

  Figure 1. A sample of 10 random walks estimated using a volatility of 0.1 and a maturity of 90 days.
  
  To calculate our average winnings, we sum up all the profits from every time we exercise the option and add zero for all the times, we would make a loss and divide by the number of random walks we have taken. Formally this is: 
  
  
