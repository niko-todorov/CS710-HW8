# ggecho package to add blur
remotes::install_github("coolbutuseless/ggecho")
library(ggecho)
library(ggplot2)

myplot <- function(myfile){
  # png(myfile)
  # plot(rnorm(20))
  # dev.off()
  dev.print(png, myfile, width=320, height=320)
  return(0)
}

Is.Versicolor <- iris$Species == "versicolor"
iris_plot <- ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length))

# Shape
iris_plot + geom_point(aes(shape=Is.Versicolor))
myplot("Shape.png")

# Brightness
iris_plot + geom_point(aes(color=Is.Versicolor)) +
  scale_color_manual(breaks = c(FALSE, TRUE), values=c(hsv(.5,1,.25), hsv(.5,1,.75)))
myplot("Brightness.png")

# Blur
blur <- ggplot(iris[Is.Versicolor, ], aes(x=Sepal.Width, y=Sepal.Length)) + geom_point(size=2.5)
blur + geom_point() + stat_echo(data=iris[!Is.Versicolor, ], size=.1)
myplot("Blur.png")

# Shape and Hue
iris_plot + geom_point(aes(color=Species, shape=Species)) +
  scale_color_manual(breaks = c("setosa", "versicolor", "virginica"), values=c(hsv(.1,1,.9), hsv(.5,1,.9), hsv(.9,1,.9)))
myplot("ShapeAndHue.png")

# Shape and Brightness
iris_plot + geom_point(aes(color=Species, shape=Species)) +
  scale_color_manual(breaks = c("setosa", "versicolor", "virginica"), values=c(hsv(.5,1,.15), hsv(.5,1,.5), hsv(.5,1,.85)))
myplot("ShapeAndBrightness.png")
