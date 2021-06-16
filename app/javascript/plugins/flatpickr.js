import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.css';
const initFlatpickr = () => {
  flatpickr(".flattpicker", {enableTime: true, minuteIncrement: 15 });
}

export { initFlatpickr };
