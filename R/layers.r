#' Create a layer of map borders.
#' 
#' @param database map data, see \code{\link[maps]{map}} for details
#' @param regions map region
#' @param fill fill colour
#' @param colour border colour
#' @param ... other arguments passed onto \code{\link[ggplot2]{polygon}}
#' @export
#' @examples
#' require("maps")
#' require("ggplot2")
#'
#' ia <- map_data("county", "iowa")
#' mid_range <- function(x) mean(range(x))
#' seats <- ddply(ia, .(subregion), colwise(mid_range, .(lat, long)))
#' ggplot(ia, aes(long, lat)) + 
#'   geom_polygon(aes(group = group), fill = NA, colour = "grey60") +
#'   geom_text(aes(label = subregion), data = seats, size = 2, angle = 45)
#'
#' data(us.cities)
#' capitals <- subset(us.cities, capital == 2)
#' ggplot(capitals, aes(long, lat)) +
#'   borders("state") + 
#'   geom_point(aes(size = pop)) + 
#'   scale_area()
borders <- function(database = "world", regions = ".", fill = NA, colour = "grey50", ...) {
  df <- map_data(database, regions)
  geom_polygon(aes(long, lat, group = group), data = df, 
    fill = fill, colour = colour, ...)
}