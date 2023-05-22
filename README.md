Index Computation
================
Zack Oyafuso (<zack.oyafuso@noaa.gov>)
2023-05-15

## Data Collection Process

For each station $j$ contained in stratum $i$, the total catch weight
and numbers are recorded for all fish and most invertebrate taxa for the
estimation of total biomass and abundance. For a subset of fish and
invertebrate taxa, the lengths of either all individuals or a subsample
of representative individuals are recorded for estimation of size
composition. A smaller subsample of fish taxa are aged for estimation of
age composition. The sex of the individuals are recorded for all
subsampled individuals to decompose the size/age composition by sex.

## Catch Rates

All trawl catch weights and numbers are standardized using the area
swept by the trawl, $E_{ij}$, of station $j$ in stratum $i$. $W_{ijk}$
is the total catch weight of taxon $k$ at station $j$ in stratum $i$.
$R_{ijk}$ is the total catch weight per area swept (also known as
“weight-CPUE”, units $kg/km^2$) for taxon $k$ at station $j$ in stratum
$i$:

$R_{ijk} = \frac{W_{ijk}}{E_{ij}}$

$N_{ijk}$ is the total numerical catch of taxon $k$ at station $j$ in
stratum $i$ enumerated either directly from every individual caught in
the trawl sample or expanded from an assumed representative subsample of
individuals. For logistical and ergonomic constraints, usually a
subsample of 100-200 individuals per taxon are randomly chosen from the
haul. The expanded total numerical catch is estimated by dividing the
total catch weight by the mean weight $h_{ijk}$:

$\hat N_{ijk} = \frac{W_{ijk}}{h_{ijk}}$

$h_{ijk} = \frac{w_{ijk}}{s_{ijk}}$

where $w_{ijk}$ and $s_{ijk}$ are the total subsampled weight and
numbers of taxon $k$ at station $j$ in stratum $i$. Since the total
numerical catch is often estimated, $\hat N_{ijk}$ will be the notation
used in the subsequent equations.

The estimate of numerical catch per area trawled (also known as
“numerical CPUE”, units $no/km^2$) is calculated similar to weight-CPUE:

$\hat S_{ijk} = \frac{\hat N_{ijk}}{E_{ij}}$

## Biomass and Abundance Calculations

Total biomass or abundance (and the associated estimated variances) of
taxon $k$ in stratum $i$ is the product of average CPUE and the area of
stratum $i$ ($A_i$):

$\hat B_{ik} = A_i \bar R_{ik}$

$\bar R_{ik} = \frac{\sum_{j = 1}^{n_i} R_{ijk}}{n_i}$

with variance:

$Var(\hat B_{ik}) = A_i^2 Var(\bar R_{ik})$

$Var (\bar R_{ik}) = \frac{\sum_{j = 1}^{n_i} (R_{ijk} - \bar R_{ik})^2 }{n_i(n_i-1)}$

Since strata are independent, the total biomass and variance across the
a subarea or the entire survey region is the calculated by summing the
stratum-level estimates of total biomass and variance, respectively,
that make up the subarea/region.

$\hat B_{k} = \sum_{i=1}^I \hat B_{ik}$

$Var(\hat B_{k}) = \sum_{i=1}^I Var(\hat B_{ik})$

Total abundance ($\hat P_{k}$) is calculated similar to total biomass,
replacing weight-CPUE with numerical CPUE.

## Size Composition

All individuals (or subsampled individuals) from the haul taxon $k$ at
station $j$ in stratum $i$ ($s_{ijk}$) were furthered identified by sex,
indexed by $m$ where 1 = Male, 2 = Female, and 3 = Unsexed. Unsexed
individuals were either too small to determine sex or not identified.
The length of the individuals were also recorded.

The calculation of the size composition comes from two expansions.
First, the observed proportion of individuals of sex $m$ in length bin
$l$ of taxon $k$ at station $j$ in stratum $i$ ($z_{ijklm}$) was used to
expand the length-frequency subsample to the total numbers of
individuals per area swept ($\hat S_{ijk}$) to calculate the estimated
number of individuals of sex $m$ and length bin $l$ of taxon $k$ at
station $j$ in stratum $i$ ($z_{ijklm}$).

$z_{ijklm} = \frac{s_{ijklm}} {\sum_{m=1}^3\sum_{l=1}^{L_{ijkm}} s_{ijklm} }$

$\hat S_{ijklm} = \hat S_{ijk} z_{ijklm}$

Second, $\hat S_{ijklm}$ was expanded to the total estimated
stratum-level numerical abundance to calculate the estimated number of
individuals of sex $m$ in length bin $l$ of taxon $k$ in stratum $i$
($\hat P_{iklm}$)

$\hat P_{iklm} = \hat P_{ik} \frac{\sum_{j=1}^{n_i} \hat S_{ijklm}} {\sum_{j=1}^{n_i}\sum_{m=1}^3\sum_{l=1}^{L} \hat S_{ijklm} }$

In the Bering Sea survey areas, only hauls with associated
length-frequency data are included in the size composition calculations.
In the GOA and AI, there are hauls especially in the early years of the
time series (late 1980s - early 1990s) where a positive catch was
reported without length-frequency data. For this type of haul, the
“average size composition” is computed using the hauls in the same
stratum and year and then used to impute the size composition for that
haul.

## Age Composition

A second-set of subsamples are drawn from the length subsample from the
haul. For the early part of the time series, individuals of a taxon were
randomly collected, stratified by length bin (1 cm bins), sex, and
management area. More recently, subsampling for ages are simply
conducted randomly from the length subsample from the haul.

$y_{klmq} = \frac{v_{klmq}} {\sum_{q=1}^Q v_{klmq}}$

where $Q_{klm}$ is the oldest age of taxon $k$ in length bin $l$ and sex
$m$.

$\hat Y_{iklmq} = \hat P_{iklm}y_{klmq}$

<!-- $\hat Y_{ikmq} = \sum_{l=1}^L \hat P_{iklm}y_{klmq}$ -->

The mean length (mm) at age $q$ and sex $m$ for taxon $k$ in stratum $i$
$D_{ikmq}$ is a weighted average length using distribution of
$\hat Y_{iklmq}$ across length bins as the weights.

$\bar d_{ikmq} = \sum_{l=1}^L \hat Y_{iklmq}d_l$

where $d_l$ is the length (mm) of length bin $l$

with weighted variance

$Var(\bar d_{ikmq}) = \sum_{l=1}^L (\frac{Y_{iklmq}}{\sum_{l=1}^L Y_{iklmq}} (d_l - \bar d_{ikmq})^2)$
