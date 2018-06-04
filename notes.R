coef_lavaan2 <- function(m) {
  m <- as_tbl(lavaan::parameterEstimates(m, standardized = TRUE))
  ## create term var
  m$term <- apply(m[, 1:3], 1, paste, collapse = " ")
  chars <- nchar(gsub("\\s.*", "", m$term))
  mchars <- max(chars)
  spaces <- function(n) paste(rep(" ", n), collapse = "")
  sp <- sapply(mchars - chars + 1, spaces)
  m$term <- unlist(Map(sub, "\\s", sp, m$term))
  ## store lhs and op for subsetting
  lhs <- m$lhs
  op <- m$op
  ## select and rename variables
  m <- m[, c("term", "est", "se", "z", "pvalue",  "std.all")]
  names(m)[4:6] <- c("est.se", "p.value", "std.est")
  ## add stars and rearrange
  m <- add_stars(m)
  m <- m[, c("term", "est", "se", "est.se", "p.value", "stars", "std.est")]
  ## residuals
  r <- m[op == "~~", ]
  cat("## Residuals: ", fill = TRUE)
  print_no_tibble(r)
  ## latent loadings
  l <- m[op == "=~", ]
  cat("\n## Latent variable: ", fill = TRUE)
  print_no_tibble(l)
  ## structural coef
  s <- m[op == "~", ]
  sl <- lhs[op == "~"]
  sn <- unique(sl)
  for (i in sn) {
    cat("\n## Regression: ", fill = TRUE)
    print_no_tibble(s[sl == i, ])
  }
}
