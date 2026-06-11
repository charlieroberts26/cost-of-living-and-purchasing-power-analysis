# Cost of Living and Purchasing Power Analysis

## Objective

Determine which states provide the greatest purchasing power after accounting for differences in income and cost of living.

## Datasets

### Median Household Income by State

- Source: U.S. Census Bureau
- Metric: Median Household Income (2018)

### Cost of Living by State

- Source: Missouri Economic Research and Information Center
- Metrics:
  - Overall Cost of Living Index
  - Grocery Index
  - Housing Index
  - Utilities Index
  - Transportation Index
  - Health Index
  - Miscellaneous Index

## Tools and Techniques

- MySQL
- Data Cleaning (removing duplicates and standardizing state names to ensure consistency across tables)
- Data Standardization
- Table Joins
- Common Table Expressions (CTEs)
- Window Functions
- Ranking Functions
- Cost of Living Analysis
- Purchasing Power Analysis

## Analysis Process

- Imported and cleaned income and cost-of-living datasets.
- Removed duplicate records from the income dataset.
- Standardized state names across both datasets.
- Joined datasets using state names.
- Calculated purchasing power metrics by adjusting median income for differences in cost of living.
- Ranked states by income and purchasing power.
- Compared rankings before and after adjusting for cost of living.
- Identified states that benefited most from lower living costs.
- Identified states whose high incomes were offset by higher living costs.

## Key Findings

### Purchasing Power Rankings

Analysis showed that purchasing power rankings differed substantially from income rankings once cost of living was taken into account.

Illinois ranked first in purchasing power despite ranking only 14th in median household income. Similarly, Iowa ranked second in purchasing power despite ranking 18th in income, while Nebraska ranked fifth despite ranking 19th in income.

These results suggest that states with moderate incomes can provide greater effective purchasing power than many higher-income states when living costs are relatively low.

### Lowest Purchasing Power States

Several states remained near the bottom of the rankings despite having relatively low living costs.

Mississippi ranked last in median household income and only improved to 50th place after adjusting for cost of living. Similarly, New Mexico remained near the bottom of the rankings despite having lower living costs than many states.

By contrast, Hawaii, California, New York, and Alaska all experienced substantial declines after adjustment because their high incomes were offset by exceptionally high living costs.

These results suggest that both income and cost of living play important roles in determining purchasing power. Low living costs alone do not guarantee strong purchasing power when household incomes are also relatively low.

### States That Lost Ground After Cost-of-Living Adjustments

Hawaii experienced the largest decline, falling from 5th place in median income to last place in purchasing power. California fell from 13th to 48th, while New York and Alaska each fell 25 places.

These results suggest that high incomes do not necessarily translate into strong purchasing power when living costs are exceptionally high.

### States That Benefited Most From Cost-of-Living Adjustments

Several states improved significantly after adjusting for cost of living.

Kansas experienced the largest improvement, rising from 24th place in income to 7th place in purchasing power. Iowa improved from 18th to 2nd, Nebraska improved from 19th to 5th, and Illinois improved from 14th to 1st.

State                Income Rank    Purchasing Power Rank    Change

Kansas                    24                  7              +17
Iowa                      18                  2              +16
Nebraska                  19                  5              +14
Illinois                  14                  1              +13
North Dakota              21                 10              +11

These findings indicate that relatively low living costs can substantially increase the effective value of household income.

### Cost of Living Drivers

Analysis of the individual cost-of-living categories showed that housing costs varied substantially more than any other category.

Category               Range

Housing                241.70
Health                  68.00
Utilities               63.70
Transportation          52.00
Miscellaneous           34.80
Groceries               33.60

Housing costs exhibited substantially greater variation than any other cost category, with a range of 241.70 index points between the least and most expensive states. By comparison, the next largest range was health costs at 68.00.

States with high housing costs generally ranked poorly in purchasing power. Hawaii, California, and New York ranked among both the most expensive housing markets and the lowest purchasing-power states. However, some higher-income states, such as Maryland and Washington, maintained relatively strong purchasing-power rankings despite elevated housing costs.

These findings suggest that housing is a major driver of purchasing-power differences across states, although its impact can be partially offset by higher household incomes.

### State Comparisons

Comparisons between individual states further illustrate the relationship between income, housing costs, and purchasing power.

Illinois and California had similar income rankings (14th and 13th respectively), but their purchasing-power rankings differed dramatically. Illinois ranked first in purchasing power, while California ranked 48th. This difference appears to be driven largely by housing costs, which were substantially higher in California.

A comparison between Iowa and Mississippi highlights the importance of considering both income and affordability. Both states ranked among the lowest-cost housing markets, yet Iowa ranked second in purchasing power while Mississippi ranked 50th. These results suggest that low housing costs alone do not guarantee strong purchasing power. Rather, purchasing power appears to depend on the combination of affordable housing and sufficiently high household incomes.

## Conclusion

This analysis demonstrates that median household income alone provides an incomplete measure of economic advantage across states. After adjusting for differences in cost of living, several states with only moderate incomes ranked among the strongest states for purchasing power, while a number of traditionally high-income states experienced substantial declines.

The results show that purchasing power is determined by the interaction between income and living costs rather than either factor in isolation. States such as Illinois, Iowa, Nebraska, and Kansas benefited from relatively low living costs, while states such as Hawaii, California, and New York saw much of their income advantage offset by higher expenses.

Housing costs emerged as the largest source of variation among cost-of-living categories and appear to be a major driver of purchasing-power differences across states. However, comparisons between states demonstrated that affordable housing alone does not guarantee strong purchasing power. Instead, the strongest outcomes were observed where relatively affordable living costs were combined with sufficiently high household incomes.

Overall, the findings suggest that rankings based solely on income can provide a misleading picture of economic well-being. Evaluating purchasing power requires consideration of both earnings and the costs required to maintain a comparable standard of living.