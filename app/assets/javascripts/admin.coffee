#= require jquery_ujs

#= require bootstrap
#= require PixelAdmin/pixel-admin.min

#= require react
#= require react_ujs
#= require components

#= require i18n
#= require i18n/translations

#= require clipboard

#= require noty

#= require_tree ./admin
#= require_self

$ ->
  # $('.dropdown-toggle').dropdown()

  init.push ->
    # $(".input_file_upload").pixelFileInput placeholder: "No file selected..."
    $('[data-toggle="tooltip"]').tooltip()

  window.PixelAdmin.start init
