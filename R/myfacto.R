###
###
###
###   Purpose:   Wrapper for calls to fortran subs
###   started:   2018/03/01 (pvr)
###
### ################################################## ###

#' Wrapper to fortran version of computing factorials
#'
#' We use a fortran subroutine to compute factorials.
#' This compiled subroutine is provided in the libs
#' directory of this package. This function provides
#' an R-Interface to this compiled subroutine.
#'
#' @param num number for which factorial should be computed
#' @return retval$answer resulting value for factorial
#' @export my_facto_r
my_facto_r <- function(num) {
  if (!is.loaded('facto')) {
    #dyn.load("facto.so")
    dyn.load(file.path(.libPaths(), "FLITestStuff", "libs", "facto.so"))
  }
  retvals <- .Fortran("facto",n = as.integer(num), answer = as.integer(1), PACKAGE = "FLITestStuff")
  return(retvals$answer)
}
