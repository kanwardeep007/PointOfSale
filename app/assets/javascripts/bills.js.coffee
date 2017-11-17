# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('form').on 'click', '.remove_order', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('div').remove()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
    field_name = $('select:last').attr('name')
    field_id = $('select:last').attr('id')
    field_quantity_2 = $(":text").last().attr("name")
    field_destroy_1= $("input:hidden").last().attr("name")
    $('#hidden_value_id').val(field_id)
    $('#hidden_value_name').val(field_name)
    $('#hidden_value_quantity_2').val(field_quantity_2)
    $('#hidden_value_destroy_1').val(field_destroy_1)
