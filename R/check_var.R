# TODO: to delete
check_var <- function(p, var) {
    browser()
    in_colData <- var %in% colnames(p$data)
    index_gene_id <- which(rownames(p$spe) == var)
    # index_gene_name <- which(rowData(p$spe)$gene_name == var)

    if (in_colData) {
        return(p)
    }

    if (length(index_gene_id) != 0) {
        p$data[[var]] <- p$spe[[var]]

        return(p)
    }

    # No matches
    # if(!any(var %in% colnames(p$data),
    #         var %in% rownames(p$spe),
    #         var %in% rowData(p$spe)$gene_name
    # )
    # )
    stop(paste0("The variable ", var, " are not in the spe object, as colData or genes."))
}
