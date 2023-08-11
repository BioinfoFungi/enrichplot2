library(tidyverse)
library(clusterProfiler)
a <- "org.Hs.eg.db"
library(a,character.only = TRUE)
data(geneList, package="DOSE")
gene <- names(geneList)[abs(geneList) > 2]
length(gene)


enrichGO(pvalueCutoff  = 0.01)


ego <- enrichGO(gene          = gene,
                universe      = names(geneList),
                OrgDb         = org.Hs.eg.db,
                ont           = "CC",
                pAdjustMethod = "BH",
                pvalueCutoff  = 0.01,
                qvalueCutoff  = 0.05,
                readable      = TRUE)
saveRDS(ego,file = "ego.rds")
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



edo <- pairwise_termsim(ego,color="pvalue")
emapplot(edo,color="pvalue")
emapplot(edo,color="p.adjust")








library(DOSE)
data(geneList)
de <- names(geneList)[abs(geneList) > 2]
edo <- enrichDGN(de)
edox <- setReadable(edo, 'org.Hs.eg.db', 'ENTREZID')

a <- "org.Hs.eg.db"
ego <- enrichGO(gene = de,
                keyType = "ENTREZID",
                OrgDb = "org.Hs.eg.db1",
                ont = "all",
                pAdjustMethod = "none",
                qvalueCutoff = 10000,
                pvalueCutoff = 0.05,
                minGSSize = 10,
                maxGSSize = 500,
                readable = TRUE)

AnnotationDbi::select(org.Hs.eg.db,
                      keys = de,
                      columns = c("ENTREZID"),
                      keytype = "ENTREZID")

organism("org.Hs.eg.db")
annotations_orgDb <- AnnotationDbi::select(org.Mm.eg.db, # database
                                           keys = rownames(degSig),  # data to use for retrieval
                                           columns = c("ENTREZID","GENENAME"), # information to retreive for given data
                                           keytype = "SYMBOL")

heatplot(edox, foldChange=geneList, showCategory=5)




for(i in 1:3) {                    # Head of for-loop
    assign(paste0("x_", i), i)       # Combining assign & paste0
}








