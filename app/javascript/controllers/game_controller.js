import { Controller } from "@hotwired/stimulus"
import ordinal from "ordinal"

export default class extends Controller {
  static targets = ["percentage"]

  connect() {
    this.calculatePlaceTotals()
  }

  calculatePlaceTotals() {
    const placeElements = document.getElementsByClassName("place-payout")
    const sum = [...placeElements].reduce((acc, el) => acc + (parseInt(el.value) || 0), 0)

    document.getElementById("schedule-game-button").disabled = (sum != 100)
  }

  changeNumberOfPlaces(event) {
    var numberOfPlaces = event.currentTarget.selectedOptions[0].value
    const elements = this.createPlaceElements(numberOfPlaces)
    this.percentageTarget.innerHTML = ""
    this.percentageTarget.appendChild(elements)
    this.calculatePlaceTotals()
  }

  createPlaceElements(numberOfPlaces) {
    var parent = document.createElement("span")
    for (var i = 1; i <= numberOfPlaces; i++) {
      parent.append(this.createLabel(i), this.createInput(i))
    }
    return parent
  }

  createLabel(place) {
    var label = document.createElement("label")
    label.setAttribute("for", place)
    label.innerHTML = `${ordinal(place)} place`
    return label
  }

  createInput(place) {
    var input = document.createElement("input")
    input.setAttribute("name", `game[payout_schedule][${place}]`)
    input.setAttribute("type", "number")
    input.setAttribute("class", "u-full-width place-payout")
    input.setAttribute("data-action", "game#calculatePlaceTotals")
    return input
  }
}
