
get_enriched <- function(object,colorBy="p.adjust") {

    Over <- object@result
    pvalueCutoff <- object@pvalueCutoff
    if(length(pvalueCutoff) != 0){
        if(colorBy=="p.adjust"){
            Over <- Over[ Over$p.adjust <= pvalueCutoff, ]
        }else if(colorBy=="pvalue"){
            Over <- Over[ Over$pvalue <= pvalueCutoff, ]
        }else if(colorBy=="qvalue"){
            Over <- Over[ Over$qvalue <= pvalueCutoff, ]
        }
    }

    # if (length(pvalueCutoff) != 0) {
    #     ## if groupGO result, numeric(0)
    #     Over <- Over[ Over$pvalue <= pvalueCutoff, ]
    #     Over <- Over[ Over$p.adjust <= pvalueCutoff, ]
    # }
    #
    # qvalueCutoff <- object@qvalueCutoff
    # if (length(qvalueCutoff) != 0) {
    #     if (! any(is.na(Over$qvalue))) {
    #         if (length(qvalueCutoff) > 0)
    #             Over <- Over[ Over$qvalue <= qvalueCutoff, ]
    #     }
    # }

    object@result <- Over
    return(object)
}

dim.enrichResult <- function(x,colorBy="p.adjust") {
    x <- get_enriched(x,colorBy)
    dim(x@result)
}

as.data.frame.enrichResult <- function(x,colorBy="p.adjust", ...) {
    x <- get_enriched(x,colorBy)
    as.data.frame(x@result, ...)
}



