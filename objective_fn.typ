#import "utils.typ": todo, make_results_table, make_scenario_table, definition
= The Objective Function 

#todo([Explain more about why we do price $*$ royalty rate and then demand. 

Discuss more about what each of these things mean, like price sensitivity and maybe we can talk about our assumptions here as it will transition better. 
])


Our model follows a nonlinear optimization problem that aims to maximize total revenue earned across all $n$ platforms that we choose to self publish on. To balance our model, in a penalty-reward lense, our reward is to maximize revenue, however for each price developed for a platform, we don't want to have each price be vary too much from eachother, such as one platform charging \$10 and another is \$100, so we add a penalty of the total revenue's variance with a scalar weight applied to it. 

As described our objective is defined as the following where $[p^-, p^+]$ represents a bound for the minimum and maximum price respectively. 

$
  phi(bold(p)) = max_(bold(p) in [p^-,p^+]) R(bold(p)) - omega bb(V)[R(bold(p))]
$<obj>

Where $R(bold(p)) = sum_(i=1)^n R_i (p_i)$ represents the total revenue earned across all $n$ platforms, our function $R_i$ is represented as the revenue earned at platform $i$ and is the product between the price of the ebook ($p_i$), the royalty rate offered at platform $i$ ($r_i$), and the demand from platform $i$ ($d_i$). 

$
  R_i (p_i) = d_i (p_i) * p_i * r_i, " for" i=1,2,..., n
$<revenue_i>

Our demand function $d_i (p_i)$ represents the portion of consumers that choose to purchase at platform $i$ given a total population $M$. The function follows a Logit model from utility theory, where the consumer's utility is driven by an attractiveness factor $v_i (p_i)$. The model also 
includes $v_0$ which is a non-negative constant which represents the attraction of the no-purchase option. We assume $v_0 > 0$ which means that there are some customers that are lost from the no-purchase option, and $sum d_i (p_i) < M$ #cite(<huang_demand_2013>). 

$
d_i (p_i) = M (v_i (p_i))/(v_0 + sum^n_(j=1) v_j (p_j)), " for" i=1,2,..., n
$<demand>
The attractiveness factor can consider different elements of a platform, such as its market share, discounts/promotions it offers, essentially features which influence a consumer's decision to purchase from it by attracting them to it. Our attraction factor is the Multi-Nomial Logit Model (MNL) which contains two parameters, $alpha_i > 0$ which is the quality of platform $i$, and $beta_i > 0$ which is the price sensitivity parameter #cite(<huang_demand_2013>). 

$
v_i (p_i) = exp(alpha_i - beta_i p_i)
$<mnl>

// Assumptions of our model
In this paper we have assumptions that our model follows, the first is that we assume the population $M$ in our model are aware of our book and will decide if they want to purchase it at one of the platforms we are selling our book, or choose the no purchase option $v_0$ and we have lost that customer. 

Our second assumption assumes that platforms that provide lower royalty rates but have a large market share will experience lower price sensitivity due to their dominant position in the market. On the other hand, our third assumption assuems that platforms which provide high royalty rates but have a small market share will experience higher price sensitivity due to their need to compete by price more than quality of the platform against the more dominant platforms. 


== Differential Evolution 

#todo[
  Describe differential evolution and what each of its operations does in our own words 
]

== Scenario Testing

To ensure our model works correctly, we design scenarios to test the model to ensure it matches our expectation. Suppose that there are $6$ platforms that we choose to publish on, platform A,B, C, D, E & F. 

=== Identical Parameters

In our first scenario, we want to consider identical parameters, where all platforms have the same royalty rates, price sensitivity, and market share. In this scenario, our expectation is that all of the platforms will have the same prices as they are equally competing with eachother.  

#make_scenario_table("scenarios/scenario1.toml", "Model Parameters for Identical Parameters Scenario")<scenario1_params>

From the parameters given in #ref(<scenario1_params>), we can see that all platforms A-F have the same price as we expect of $\$10$ as they are equally competing with eachother and thus will all charge at $p^-$. 

#make_results_table("results/scenario1_mnl.toml", "Optimal Price/Profit for Identical Parameters Scenario")<scenario1>

It is important to note that if $v_0$ is decreased we expect revenue to be increased across all platforms as we expect total revenue across all platforms to proportionally increase as more consumers will be choosing to purchase the book on a platform. If $v_0 = 0.5$ instead, then as shown in #ref(<scenario2>), where price and profit for each platform doesn't get impacted but revenue increases to $\$28964$ compared to $\$18259.7$ from #ref(<scenario1>). 

#make_results_table("results/scenario2_mnl.toml", "Decreased No Purchase Option")<scenario2>

=== Varying Royalty Rates 

In our second scenario, we want to focus on the impact the royalty rate has on the optimal price across several platforms, the royalty rate is the rate that the author earns from the sale of the publication, the higher the rate, the more the author will earn from the sale. 

#todo([Improve this and add expectation and focusing on main expectation of platform A vs F (extreme cases)])

#make_scenario_table("scenarios/scenario4.toml", "Model Parameters for Varying Royalty Rates Scenario")

#todo([Explain how when price sensitivity is not considered, the model will maximize revenue across all platforms and that we expect platform A to charge the least and F to charge the most. ])

#make_results_table("results/scenario4_mnl.toml", "Varying Royalties Scenario Results")

#todo([Also talk about how when $omega = 0.1$, the distance between each platform increases])

#make_results_table("results/scenario5_mnl.toml", "Varying Royalties with Increased Penalty Weight Results")

=== Dominant vs Small Player

In this scenario we first introduce the definitions of what a dominant and small player platform means within the context of our paper and objective function. 

#definition([
  We denote $Delta$ to be a dominant platform if it has the following properties: 
  1. It has the largest market share across all platforms: $alpha_Delta = max(bold(alpha))$
  2. It provides the least amount of royalty across all platforms: $r_Delta = min(bold(r))$
  3. Due to its dominance, the platform $Delta$ experiences the least amount of price sensitivity: $beta_delta = min(bold(delta))$
])<dominant_platform>

#definition([
  We denote $delta$ to be a small player platform if it has the following properties: 
  1. It has the smallest market share across all platforms: $alpha_delta = min(bold(alpha))$
  2. It provides the most amount of royalty across all platforms: $r_delta = max(bold(r))$
  3. For platform $delta$ to try to penetrate the market, it must compete on price and thus is subject to the highest amount of price sensitivity: $beta_delta = max(bold(delta))$
])<small_player>

In this scenario we would like to model something realistic, where from the platforms we plan to publish on (A-F), there exists a clear dominant platform which follows #ref(<dominant_platform>) will be our last platform F, and our small player which will have the inverse relationship as defined in #ref(<small_player>) will be our first platform A, the rest of the platforms will be in the middle between these two "extremes". 

Our expectation of the pricing for this scenario is that for the small player to compete on price from the dominant player, we charge the least to undercut the dominant player, while the dominant player will charge the most as it is not worried as much due to its lower price sensitivity. 

//#todo[Explain this scenario and expectations]

#make_scenario_table("scenarios/scenario6.toml", "Parameters for Dominant vs Small Player Scenario")

#todo[Describe the results]

#make_results_table("results/scenario6_mnl.toml", "Dominant vs Small Player Results")