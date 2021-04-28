import setupTab from '../setuptab'

const main = () => {
  setupTab(document.querySelector('#home-events-tab'));
}

document.addEventListener('turbolinks:load', main);
