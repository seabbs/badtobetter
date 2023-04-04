
require(jsonlite)

pars <- lapply(c("data1","data2"), read_json)

p <- data.frame(id=1:1e4)
p$high_risk <- runif(10000) < pars[[1]][[2]]
exps <- rbinom(dim(p)[1], 30, ifelse(p$high_risk, pars[[1]][[3]], pars[[1]][[4]]))
p$outcome <- sapply(exps, function(en) length(unique(sample(4, en, rep = TRUE))))
write.csv(p, "pop1.csv", row.names = F)

p2 <- data.frame(id=1:10000)
p2$high_risk <- runif(1e4) < pars[[2]][[2]]
exps <- rbinom(1e4, 30, ifelse(p2$high_risk, pars[[2]][[3]], pars[[2]][[4]]))
p2$outcome <- sapply(exps, function(en) length(unique(sample(4, en, rep = TRUE))))
write.csv(p2, "pop2.csv", row.names = F)

p$Country <- pars[[1]]$Country
p2$Country <- pars[[2]]$Country
ps <- rbind(p,p2)

lines <- do.call(data.frame, aggregate(outcome ~ Country, ps, quantile, probs=(1:3)/4))

require(ggplot2)

ggsave("figure.png", ggplot(ps) + theme_minimal() + aes(outcome, fill=Country, alpha=high_risk) +
  geom_histogram(bins = 5) + geom_vline(aes(xintercept=outcome.50., linetype="Median", color=Country), lines) +
  geom_vline(aes(xintercept=outcome.25.-.1, linetype="Lower Quartile", color=Country), lines) +
  geom_vline(aes(xintercept=outcome.75.+.1, linetype="Upper Quartile", color=Country), lines) +
facet_grid(Country ~ .) +  scale_alpha_manual("Risk Group", labels = function(high_risk) c("Low","High")[as.numeric(high_risk)+1], values = c(`FALSE`=0.5,`TRUE`=0.7)) +
  scale_x_continuous("Number of Infections") + scale_fill_discrete() + scale_color_discrete() + scale_linetype_manual("Measure", values=c(`Lower Quartile`="dashed",Median="solid",`Upper Quartile`="dotted")) + theme_bw())