window.addEventListener('turbo:load', function(){
  const closeButton = document.getElementById('close-button');
  if (closeButton) {
    closeButton.addEventListener('click', function() {
        window.location.href = '/';
    });
  }
});