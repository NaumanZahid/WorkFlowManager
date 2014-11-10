# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
  myJsPlumb = jsPlumb.getInstance(
    Container: 'workflow'
    PaintStyle:
      lineWidth: 1
      strokeStyle: "black"
      outlineColor: "black"
      outlineWidth: 1
    Connector: [
      "StateMachine"
      {
        curviness: 30
      }
    ]
    Endpoint: [
      "Dot"
      {
        radius: 10
      }
    ]
    ConnectionOverlays: [
      [
        "Arrow"
        {
          location: 1
          id: "arrow"
          length: 14
          foldback: 0.8
        }
      ]
      [
        "Label"
        {
          label: "FOO"
          id: "label"
          cssClass: "aLabel"
        }
      ]
    ]
    EndpointStyle:
      fillStyle: "green"
    anchor: [
      "Assign"
      {
        position: "Fixed"
      }
    ]
  )
  console.log myJsPlumb
  myJsPlumb.draggable $('.state'),
    containment: 'parent'

  options = {isTarget: true}
  $.each $('.state'), (index, value) ->
    myJsPlumb.addEndpoint(value, options)











