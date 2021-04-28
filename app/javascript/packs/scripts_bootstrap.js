(function iife() {
  console.log('Entrance ...');
  window.addEventListener('load', () => {
    console.log('Loading ...');
    if (document.querySelector('#home-page')) {
      import('./events/index');
    }

    if (document.querySelector('#user-show-page')) {
      import('./users/show')
    }
  });
})();
