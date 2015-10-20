pollutantmean <- function(directory, pollutant, id = 1:332) {
    files_full <- list.files(directory, full.names = TRUE)
    summary(files_full)
    files_list <- vector(mode = "list", length = length(files_full))
    for (i in seq_along(files_full)) {
        files_list[[i]] <- read.csv(files_full[i])
    }
    output <- do.call(rbind,files_list)
    data_subset <- subset(output, ID %in% id)
    mean(data_subset[, pollutant], na.rm=TRUE)
}