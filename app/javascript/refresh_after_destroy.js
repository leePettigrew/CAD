
document.addEventListener('turbolinks:load', function() {
  const destroyButtons = document.querySelectorAll('[data-confirm][data-remote][data-method="delete"][data-refresh]');

  destroyButtons.forEach(button => {
    button.addEventListener('ajax:success', function() {
      // Refresh the page upon successful deletion
      window.location.reload();
    });
  });
});