window.addEventListener('turbo:load', function(){
  const closeButton = document.getElementById('close-button');
  if (closeButton) {
    closeButton.addEventListener('click', function() {
      const userId = closeButton.getAttribute('data-user-id');
        window.location.href = "/users/" + userId;
    });
  }
});