#import "utils.typ": todo 
= Empirical Result for MoKa Reads

MoKa Reads is a not-for-profit brand that I created for my important opensource projects and opensource publications. 
In this paper we will use our model to determine the best prices to sell our books in the future across multiple platforms that offer 
self publishing options and allow us to transparently price our paper, and will become more accurate as internal data grows of actual sales, market share for our audience, etc. 

In terms of the empirical results we will discuss, a lot of the data we have to work with comes from Booknet Canada report which examines Canadian readership and sales across several categories. 

#todo[
  How to transitition here, explain difference between raw market share and market share which is normalized, and raw is from the booknet study
]

#figure(
  table(
    columns: 4,
    ..csv("results/platforms.csv").flatten()
  ),
  caption: [Direct Publishing Platforms's Royalty Rates and Market Share]
)

#todo[
  How do we justify our $beta$ values, we could first discuss that from booknet we notice that the ebook market in Canada is a very price sensitive market, and we could look at different ranges of $beta$ and how they impact the final prices, and take an average?
]