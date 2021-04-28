const setupTab = (wrapper) => {
  if (!wrapper) {
    return;
  }

  let activeTabItem = wrapper.querySelector('.tab-header a.active'),
    activeTabHeader = wrapper.querySelector('.tab-item.active');
  const headers = wrapper.querySelectorAll('.tab-header a');
  headers.forEach(a => {
    a.addEventListener('click', evt => {
      evt.preventDefault();

      activeTabHeader.classList.remove('active');
      activeTabHeader = a;
      activeTabHeader.classList.add('active');

      activeTabItem.classList.remove('active');
      activeTabItem = wrapper.querySelector(`#${a.getAttribute('data-tab-item')}`);
      activeTabItem.classList.add('active');
    });
  });
}

export default setupTab;
