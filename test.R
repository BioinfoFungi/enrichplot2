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
ego <- readRDS("ego.rds")

heatplot(ego,showCategory=20,color="pvalue")
dotplot(ego,showCategory=20,color="pvalue")
barplot(ego,showCategory=10,
        color="pvalue",
        split="ONTOLOGY",
        orderBy = "GeneRatio") +
        facet_grid(ONTOLOGY~., scale='free')


d <- godata('org.Hs.eg.db', ont="BP")
ego2 <- pairwise_termsim(ego, method = "Wang", semData = d)
treeplot(ego2, showCategory = 30)












library(DOSE)
data(geneList)
de <- names(geneList)[abs(geneList) > 2]
edo <- enrichDGN(de)
edox <- setReadable(edo, 'org.Hs.eg.db', 'ENTREZID')




heatplot(edox, foldChange=geneList, showCategory=5)













