const previewImageOnFileSelect = () => {
  // we select the photo input
  const inputs = [document.getElementById('photo-input'), document.getElementById('photo-input-2')];
  inputs.filter(input => input).forEach((input) => {
    if (input) {
      // we add a listener to know when a new picture is uploaded
      input.addEventListener('change', () => {
        // we call the displayPreview function (who retrieve the image url and display it)
        displayPreview(input);
      })
    }
  })
}

const displayPreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById('photo-preview').src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.getElementById('photo-preview').classList.remove('hidden');
  }
}

export { previewImageOnFileSelect };
