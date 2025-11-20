# Scale Effect Analysis on Mer Bleue Vegetation Cover

## Project Overview
This was my assignment for the spatial analysis course, focusing on understanding how changes in spatial resolution (grain size) affect land cover classification results. I analyzed vegetation data from the Mer Bleue peatland in Canada to see how different vegetation types respond when we coarsen the resolution.

## What I Investigated
The main question was: **What happens to our understanding of vegetation patterns when we look at the landscape at different scales?**

I started with high-resolution data (28m) and systematically coarsened it to 56m, 112m, 224m, 448m, and 896m resolutions to see how the proportions of six vegetation classes changed.

## Vegetation Classes
1. **Other surfaces** - Developed areas and other non-vegetated surfaces
2. **Closed tree canopy** - Dense forest cover
3. **Open-tree canopy - tree cover** - Sparse trees
4. **Open-tree canopy - shrub and moss cover** - Low vegetation under open canopy
5. **Peatland vegetation - shrubs and mosses** - Characteristic bog plants
6. **Pseudo-tundra vegetation** - Low-growing tundra-like vegetation

## Methodology

### 1.Data Processing
- Loaded the Mer Bleue vegetation raster using R's `raster` package
- Used `aggregate(mb, factor=2, fun=modal)` to coarsen resolution by factors of 2, 4, 8, 16, and 32
- Calculated area proportions for each vegetation class at each resolution
- Created visualizations to compare patterns across scales

### 2.Key R Skills Used
- Raster data manipulation with `raster` package
- Data frame management and transposition
- Custom plotting with proper axis labeling
- Systematic multi-resolution analysis

## Key Findings

### 1.Scale-Dependent Patterns
- **Barren land and other surfaces** showed the most dramatic changes with scale
- Barren land decreased from ~10% at 28m to ~3% at 896m resolution
- **Closed canopy forests** remained relatively stable across scales
- **Open canopy areas** showed moderate sensitivity to resolution changes
  # 创建数据框
proportion <- data.frame(
  Resolution = c(28, 56, 112, 224, 448, 896),
  Other_Surfaces = c(0.23035920, 0.24073003, 0.25556117, 0.26996967, 0.31439394, 0.30303030),
  Closed_Canopy = c(0.28184897, 0.29104813, 0.30535895, 0.32355915, 0.31818182, 0.34848485),
  Open_Canopy_tree = c(0.20095267, 0.19278967, 0.18402427, 0.17189080, 0.16287879, 0.16666667),
  Open_Canopy_tall_shrub = c(0.12305374, 0.11773022, 0.10793731, 0.10111223, 0.08712121, 0.09090909),
  Open_Canopy_low_shrub = c(0.05972035, 0.05970053, 0.05788675, 0.06167846, 0.06439394, 0.06060606),
  Barren_land = c(0.10406507, 0.09800141, 0.08923155, 0.07178969, 0.05303030, 0.03003033)
)

# 加载ggplot2包，如果没有安装，请先安装
# install.packages("ggplot2")
library(ggplot2)
library(reshape2)

# 将数据从宽格式转换为长格式
proportion_long <- melt(proportion, id.vars = "Resolution", variable.name = "Land_Cover", value.name = "Proportion")

# 绘制折线图
p1 <- ggplot(proportion_long, aes(x = Resolution, y = Proportion, color = Land_Cover)) +
  geom_line() +
  geom_point() +
  labs(title = "Vegetation Proportion Changes with Scale",
       x = "Resolution (m)",
       y = "Proportion") +
  theme_minimal() +
  scale_x_continuous(breaks = proportion$Resolution) +
  scale_color_manual(values = c("red", "darkgreen", "green", "lightgreen", "orange", "brown"))

# 保存图片
ggsave("proportion_all_classes.png", p1, width = 8, height = 6)

### 2.Most Affected Classes
- **Most sensitive**: Barren land and other surfaces (changed by >0.06 in proportion)
- **Least sensitive**: Closed canopy and open canopy areas (changed by ~0.03)

### 3.Ecological Interpretation
As Turner et al. (2001) discusses, transferring from fine to coarse grain causes information loss. Small, fragmented habitats like barren patches get "averaged out" when we look at broader scales, while large, continuous features like closed forests remain visible.

## Files Included
- `vegetation_scale_analysis.R` - Complete R script with all analysis steps
- `proportion_plots.png` - Graphs showing how each vegetation type changes with resolution
- `report.pdf` - Formal assignment submission (if applicable)

## How to Run
1. R - `raster` package
2. Use `mbveg2.rst` and `mbveg2.rdc` files in the working directory
3. Run the R script:
```r
source("vegetation_scale_analysis.R")
```
