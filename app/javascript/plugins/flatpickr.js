import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".flattpicker", {enableTime: true});
}

export { initFlatpickr };