## ----setup, include = FALSE----------------------------------------------
library(keras)
knitr::opts_chunk$set(comment = NA, eval = FALSE)

## ------------------------------------------------------------------------
#  CustomWrapper <- R6::R6Class(
#    "CustomWrapper",
#  
#    inherit = KerasWrapper,
#  
#    public = list(
#      weight_shape = NULL,
#      weight_init = NULL,
#      custom_weight = NULL,
#  
#      initialize = function(weight_shape, weight_init) {
#        self$weight_shape <- weight_shape
#        self$weight_init <- weight_init
#      },
#  
#      build = function(input_shape) {
#  
#        # call this before doing any customization
#        super$build(input_shape)
#  
#        self$custom_weight <- super$add_weight(
#          name = "custom_weight",
#          shape = self$weight_shape,
#          initializer = self$weight_init,
#          trainable = TRUE
#        )
#  
#        regularizer <- k_log(self$custom_weight)
#        super$add_loss(regularizer)
#  
#      }
#    )
#  )

## ------------------------------------------------------------------------
#  wrapper_custom <-
#    function(object,
#             layer,
#             weight_shape,
#             weight_init,
#             input_shape = NULL) {
#      create_wrapper(
#        CustomWrapper,
#        object,
#        list(
#          layer = layer,
#          weight_shape = weight_shape,
#          weight_init = weight_init,
#          input_shape = input_shape
#        )
#      )
#    }

## ------------------------------------------------------------------------
#  model <- keras_model_sequential() %>%
#    wrapper_custom(
#      layer = layer_dense(units = 4),
#      weight_shape = shape(1),
#      weight_init = initializer_he_normal(),
#      input_shape = shape(2)
#    ) %>%
#    wrapper_custom(
#      layer = layer_dense(units = 2),
#      weight_shape = shape(1),
#      weight_init = initializer_he_normal()
#    ) %>%
#    layer_dense(units = 1)
#  
#  model %>% compile(optimizer = "adam", loss = "mse")
#  
#  model %>% fit(
#    x = matrix(1:10, ncol = 2),
#    y = matrix(1:5, ncol = 1),
#    batch_size = 1,
#    epochs = 1
#  )

