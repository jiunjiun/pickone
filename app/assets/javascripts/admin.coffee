#= require jquery_ujs
#= require materialize-sprockets

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
  $(".button-collapse").sideNav()
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip({delay: 50})
