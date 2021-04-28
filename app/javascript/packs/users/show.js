import setupTab from '../setuptab'

const main = () => {
  setupTab(document.querySelector('#user-created-events'));
  setupTab(document.querySelector('#user-invited-events'));
}

document.addEventListener('turbolinks:load', main);
