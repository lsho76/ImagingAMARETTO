#' @title cAMARETTO_ColorOneModule
#'
#' Creates a network with one (or none) colored modules
#'
#' @param cAMARETTOnetworkM The output of the Module Network function.
#' @param cAMARETTOnetworkC The output of the Identify Communities function.
#' @param ModuleNr The module number that you want to highlight.
#'
#' @return None
#' 
#' @import igraph
#' @examples
#' cAMARETTO_ColorOneModule(cAMARETTOnetworkM, cAMARETTOnetworkC, 2)
#' @export
cAMARETTO_ColorOneModule <- function(cAMARETTOnetworkM, cAMARETTOnetworkC, ModuleNr) {

  selected_group <- cAMARETTOnetworkC$community_list[names(cAMARETTOnetworkC$community_list)==ModuleNr]
  color_group <- cAMARETTOnetworkC$color_list[names(cAMARETTOnetworkC$color_list)==ModuleNr]
  Nodes_Mnetwork <- igraph::as_data_frame(cAMARETTOnetworkM$module_network, what="vertices")
  
  layout_1<-cAMARETTOnetworkM$layoutMN
  layout_1<- norm_coords(layout_1, ymin=-1, ymax=1, xmin=-1, xmax=1)
  plot(cAMARETTOnetworkC$CommGraph,
       rescale=F,
       layout = layout_1*1.2,
       # layout=cAMARETTOnetworkM$layoutMN,
       vertex.color=as.character(Nodes_Mnetwork$color),
       vertex.label=NA,
       # vertex.frame.color=NA,
       # edge.color="gray80",
       mark.groups = selected_group,
       mark.col=color_group,
       # mark.border=NA,
       main=NA)
  
  legend(x = -1.5, y = -1.1+0.05*length(cAMARETTOnetworkM$colMN), legend = names(cAMARETTOnetworkM$colMN), col = cAMARETTOnetworkM$colMN, pch=19, bty="n",ncol=ceiling(length(cAMARETTOnetworkM$colMN)/5))
}
