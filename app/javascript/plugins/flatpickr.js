import flatpickr from "flatpickr" // Note this is important!
import "flatpickr/dist/themes/light.css"

flatpickr(".datepicker", {
  minDate: "today"
  // enableTime: true
})
