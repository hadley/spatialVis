\name{map_data}
\alias{map_data}
\title{Create a data frame of map data.}
\usage{map_data(map, region=".", exact=FALSE)}

\description{
  Create a data frame of map data.
}
\arguments{
  \item{map}{name of map provided by \code{maps} package.  These 
include \code{\link{county}}, \code{\link{france}}, \code{\link{italy}},
\code{\link{nz}}, \code{\link{state}}, \code{\link{usa}}, 
\code{\link{world}}, \code{\link{world2}}.}
  \item{region}{name of subregions to include.  Defaults to \code{.} which
includes all subregion.  See documentation for \code{\link[maps]{map}}
for more details.}
  \item{exact}{should the \code{region} be treated as a regular expression
(\code{FALSE}) or as a fixed string (\code{TRUE}).}
}
\examples{require("maps")
require("ggplot2")

states <- map_data("state")
arrests <- USArrests
names(arrests) <- tolower(names(arrests))
arrests$region <- tolower(rownames(USArrests))

choro <- merge(states, arrests, sort = FALSE, by = "region")
choro <- choro[order(choro$order), ]
qplot(long, lat, data = choro, group = group, fill = assault,
geom = "polygon")
qplot(long, lat, data = choro, group = group, fill = assault / murder,
geom = "polygon")}
