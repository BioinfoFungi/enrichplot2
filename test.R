library(tidyverse)
library(clusterProfiler)
library(org.Hs.eg.db)
data(geneList, package="DOSE")
gene <- names(geneList)[abs(geneList) > 2]
length(gene)


enrichGO(pvalueCutoff  = 0.01)


# ego <- enrichGO(gene          = gene,
#                 universe      = names(geneList),
#                 OrgDb         = org.Hs.eg.db,
#                 ont           = "CC",
#                 pAdjustMethod = "BH",
#                 pvalueCutoff  = 0.01,
#                 qvalueCutoff  = 0.05,
#                 readable      = TRUE)
# saveRDS(ego,file = "ego.rds")
ego <- readRDS("a.rds")

enrichplot2::dotplot(ego,showCategory=20,color="pvalue")

d <- godata('org.Hs.eg.db', ont="BP")
ego2 <- pairwise_termsim(ego, method = "Wang", semData = d)
treeplot(ego2, showCategory = 30)

